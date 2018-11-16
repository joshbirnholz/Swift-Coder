import PlaygroundSupport
import Cocoa
import WebKit

PlaygroundPage.current.needsIndefiniteExecution = true

typealias Match = (range: Range<String.Index>, value: String)

extension String {
	
	func matches(forRegex regex: String) -> [(fullMatch: Match, groups: [Match])] {
		do {
			let regex = try NSRegularExpression(pattern: regex)
			let results = regex.matches(in: self, range: NSRange(startIndex..., in: self))
			return results.map { result in
				let fullMatchRange = Range(result.range, in: self)!
				let groups: [Match]
				
				if result.numberOfRanges > 1 {
					groups = (1 ..< result.numberOfRanges).compactMap { i in
						guard let range = Range(result.range(at: i), in: self) else {
							return nil
						}
						let value = String(self[range])
						return (range: range, value: value)
					}
				} else {
					groups = []
				}
				
				let fullMatch = (range: fullMatchRange, value: String(self[fullMatchRange]))
				
				return (fullMatch, groups)
			}
		} catch {
			return []
		}
	}
	
}

extension StringProtocol {
	/// Shouldn't work if `open` == `close`
	func character(atIndex i: Index, isContainedWithin open: Character, and close: Character) -> Bool {
		let pre = self[startIndex ..< i]
		let post = self[i...]
		
		let precededByOpenBeforeClosed: Bool = {
			guard let lastOpenIndex = pre.lastIndex(of: open) else { return false }
			if let lastClosedIndex = pre.lastIndex(of: close) {
				return lastOpenIndex > lastClosedIndex
			}
			return true
		}()
		
		let followedByClosedBeforeOpen: Bool = {
			guard let firstClosedIndex = post.firstIndex(of: close) else { return false }
			if let firstOpenIndex = post.firstIndex(of: open) {
				return firstClosedIndex < firstOpenIndex
			}
			return true
		}()
		
		return precededByOpenBeforeClosed && followedByClosedBeforeOpen
	}
}

extension Array: LosslessStringConvertible where Element: LosslessStringConvertible {
	public init?(_ description: String) {
		if let arr = description.matches(forRegex: "\\[(.*)]").first?.groups.first?.value.split(separator: ",").compactMap({
			Element($0.trimmingCharacters(in: .whitespacesAndNewlines))}) {
			if Element.self == String.self {
				self = (arr as! [String]).map {
					String($0[$0.index(after: $0.startIndex)..<$0.index(before: $0.endIndex)])
					} as! [Element]
			} else {
				self = arr
			}
		} else {
			return nil
		}
	}
}

func doOnMainThread(_ block: () -> ()) {
	if Thread.isMainThread {
		block()
	} else {
		DispatchQueue.main.sync {
			block()
		}
	}
}

enum Result<T> {
	case success(T)
	case failure(Error)
	
	init(wrapping block: (() throws -> T)) {
		do {
			let result = try block()
			self = .success(result)
		} catch {
			self = .failure(error)
		}
	}
	
	init(_ result: T?, _ error: Error?) {
		if let error = error {
			self = .failure(error)
		} else if let result = result {
			self = .success(result)
		} else {
			self = .failure(NSError())
		}
	}
	
	init(_ result: Any?, _ error: Error?, as type: T.Type) {
		if let error = error {
			self = .failure(error)
		} else if let result = result as? T {
			self = .success(result)
		} else {
			self = .failure(NSError())
		}
	}
	
	func unwrap() throws -> T {
		switch self {
		case .success(let result):
			return result
		case .failure(let error):
			throw error
		}
	}
}

class CodingBatQuestionTester: NSObject, WKNavigationDelegate {
	let webview = WKWebView(frame: .zero)
	
	public static let swiftTypesForJavaTypes = [
		"String": "String",
		"int": "Int",
		"boolean": "Bool",
		"String[]": "[String]",
		"List<Integer>": "[Int]",
		"int[]": "[Int]",
		"boolean[]": "[Bool]",
		"double": "Double",
		"float": "Float",
		"double[]": "[Double]",
		"float[]": "[Float]",
		"void": "Void",
		"List<String>": "[String]",
		"Map<String, String>": "[String: String]",
		"Map<String, Integer>": "[String: Int]",
		"Map<String, Boolean>": "[String: Bool]"
	]
	
	override init() {
		super.init()
		webview.navigationDelegate = self
	}
	
	struct ProblemInfo {
		var title: String
		var prompt: String
		var javaReturnType: String
		var parameters: [(type: String, name: String)]
		var testCases: [(expectedResult: String, arguments: [String])]
		
		public var initCode: String {
			let swiftReturnType = CodingBatQuestionTester.swiftTypesForJavaTypes[javaReturnType]!
			
			let testCases: [(expectedResult: String, arguments: [String])] = self.testCases.map { testCase in
				var testCase = testCase
				// The Swift compiler can't determine the type of empty array literals.
				// This loop turns arguments like "[]" into "[Int]()"
				for (argNumber, arg) in testCase.arguments.enumerated() {
					if arg == "[]" {
						testCase.arguments[argNumber] = CodingBatQuestionTester.swiftTypesForJavaTypes[parameters[argNumber].type]! + "()"
					}
					if arg == "{}" {
						testCase.arguments[argNumber] = CodingBatQuestionTester.swiftTypesForJavaTypes[parameters[argNumber].type]! + "()"
					}
				}
				
				if testCase.expectedResult == "[]" {
					testCase.expectedResult = CodingBatQuestionTester.swiftTypesForJavaTypes[javaReturnType]! + "()"
				}
				
				if testCase.expectedResult == "{}" {
					testCase.expectedResult = CodingBatQuestionTester.swiftTypesForJavaTypes[javaReturnType]! + "()"
				}
				
				for (argNumber, arg) in testCase.arguments.enumerated() where self.parameters[argNumber].type.hasPrefix("Map") {
					testCase.arguments[argNumber] = arg.replacingOccurrences(of: "{", with: "[").replacingOccurrences(of: "}", with: "]")
				}
				
				if swiftReturnType.contains(":") {
					testCase.expectedResult = testCase.expectedResult.replacingOccurrences(of: "{", with: "[").replacingOccurrences(of: "}", with: "]")
				}
				
				return testCase
			}
			
			let initCode = """
			Problem(
				title: "\(title)",
				returnType: \(swiftReturnType).self,
				parameters: [
					\(parameters.map { "Problem.Parameter(name: \"\($0.name)\", type: \(CodingBatQuestionTester.swiftTypesForJavaTypes[$0.type]!).self)" }.joined(separator: ",\n\t\t"))
				],
				prompt: "\(prompt.replacingOccurrences(of: "\"", with: "\\\"").replacingOccurrences(of: "\n", with: "\\n"))",
				solution: nil,
				hint: nil,
				testCases: [
					\(testCases.map { "Problem.TestCase(expectation: \($0.expectedResult), arguments: \($0.arguments.joined(separator: ", ")))" }.joined(separator: ",\n\t\t"))
				],
				eulerMode: false
			)
			"""
			
			return initCode
		}
	}
	
	var completion: ((Result<ProblemInfo>) -> ())?
	
	func load(url: URL, completion: @escaping (Result<ProblemInfo>) -> ()) {
		self.completion = completion
		webview.load(URLRequest(url: url))
	}

	func parameters(fromCode code: String) -> [(type: String, name: String)] {
		guard let fullParamsString = code.matches(forRegex: "\\(([^)]+)\\)").first?.groups.first?.value else { return [] }
		var i = code.startIndex
		let paramsStrings = fullParamsString.split(whereSeparator: { (char) -> Bool in
			defer {
				i = fullParamsString.index(after: i)
			}
			guard char == "," else { return false }
			
			return !fullParamsString.character(atIndex: i, isContainedWithin: "<", and: ">")
			
		})
		
		let parameters: [(type: String, name: String)] = paramsStrings.map { paramString in
			i = paramString.startIndex
			let split = paramString.split(whereSeparator: { (char) -> Bool in
				defer {
					i = paramString.index(after: i)
				}
				
				guard char == " " else { return false }
				
				return !paramString.character(atIndex: i, isContainedWithin: "<", and: ">")
			})
			return (type: String(split[0]), name: String(split[1]))
		}
		
		return parameters
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		getResponse { (response) in
			let result = Result<ProblemInfo> { () -> CodingBatQuestionTester.ProblemInfo in
				let jsResponse = try response.unwrap()
				
				guard let title = jsResponse["title"] as? String,
				let prompt = jsResponse["prompt"] as? String,
					let javaReturnType = jsResponse["returnType"] as? String,
				let code = jsResponse["sampleCode"] as? String,
				let testCasesStrings = jsResponse["testCases"] as? [String] else {
						throw NSError(domain: "Couldn't get info", code: -1, userInfo: ["Possible values": "title, prompt, returnType, code, paramsStrings, testCases"])
				}

				let parameters: [(type: String, name: String)] = self.parameters(fromCode: code).map { param in
					var param = param
					if param.name == "map" && param.type.hasPrefix("Map") {
						param.name = "dictionary"
					}
					return param
				}
				
				let testCases: [(expectedResult: String, arguments: [String])] = testCasesStrings.compactMap { testCase in
					let split = testCase.components(separatedBy: " → ")
					guard let argumentsString = split[0].matches(forRegex: "\\(([^)]+)\\)").first?.groups.first?.value else { return nil }
					var i = argumentsString.startIndex
					var arguments = argumentsString.split(whereSeparator: { (char) -> Bool in
						defer {
							i = argumentsString.index(after: i)
						}
						
						guard char == "," else { return false }
						
						return !argumentsString.character(atIndex: i, isContainedWithin: "{", and: "}") && !argumentsString.character(atIndex: i, isContainedWithin: "[", and: "]")
					}).map(String.init)
					
					let expectedResult = split[1]
					
					return (expectedResult: expectedResult, arguments: arguments)
				}
				
				return ProblemInfo(title: title,
											  prompt: prompt,
											  javaReturnType: javaReturnType,
											  parameters: parameters,
											  testCases: testCases)
			}
			
			self.completion?(result)
			self.completion = nil
		}
	}
	
	private func getResponse(completion: @escaping (Result<[String: Any]>) -> ()) {
		doOnMainThread {
		let script = """

		function getReturnType(){const regex=/public (.+) .+\\(/gm;const str=document.ace_editor.getValue();let m;var returnType;while((m=regex.exec(str))!==null){if(m.index===regex.lastIndex){regex.lastIndex++} m.forEach((match,groupIndex)=>{if(groupIndex==1&&match!==undefined){returnType=match}})} return returnType}

		var response = {};

		response.title = document.querySelectorAll('.h2')[3].innerText;
		response.prompt = document.querySelector('.max2').innerText;
		
		const defaultCodeForJavaTypes = {
		"String": 'return "";',
		"int": "return 0;",
		"boolean": "return false;",
		"String[]": "String[] myArray = { }; return myArray;",
		"int[]": "int[] myArray = { }; return myArray;",
		"List<Integer>": "List<Integer> myList = null; return myList;",
		"List<String>": "List<String> myList = null; return myList;",
		"Map<String, String>": "Map<String, String> myMap = null; return myMap;",
		"Map<String, Integer>": "Map<String, Integer> myMap = null; return myMap;",
		"Map<String, Boolean>": "Map<String, Boolean> myMap = null; return myMap;"
		};
		
		var sampleCode = document.ace_editor.getValue();

		if (!sampleCode.startsWith("public ")) {
			sampleCode = "public " + sampleCode;
		}

		response.sampleCode = sampleCode;
		
		var returnType = getReturnType();

		response.returnType = returnType;

		var mimumCode = sampleCode.replace("}", defaultCodeForJavaTypes[returnType] + " }");
		
		document.ace_editor.setValue(mimumCode);

		var data = 'id='   + encodeURIComponent(document.codeform.id.value) + '&' +
		'code=' + encodeURIComponent(document.ace_editor.getValue()) + '&' +
		'cuname=' + encodeURIComponent(document.codeform.cuname.value) + '&' +
		'owner=' + encodeURIComponent(document.codeform.owner.value);
		if (document.codeform.parent) {
			data +=  '&parent=' + encodeURIComponent(document.codeform.parent.value);
		}
		if (document.codeform.outputonly.checked) {
			data += '&outputonly=1';
		}
		if (document.codeform.date) {
			data +=  '&date=' + encodeURIComponent(document.codeform.date.value);
		}
		if (document.codeform.expnext) {  // exp
			data +=  '&expnext=' + encodeURIComponent(document.codeform.expnext.value);
		}
		if (document.codeform.adate) {  // exp
			data +=  '&adate=' + encodeURIComponent(document.codeform.adate.value);
		}
		if (document.ace_font) {  // 2017
			data +=  '&font=' + encodeURIComponent(document.ace_font);
		}
		if(re.readyState > 0 && re.readyState < 4) {  // do nothing if already in flight
			//return true;
		}
		re.open("POST", '/run', false);
		re.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		re.send(data);
		
		var text = re.responseText;
		document.getElementById('results').innerHTML = text;
		
		response.testCases = Array.prototype.slice.call(document.getElementById('tests').children[0].rows).slice(1).map(row => row.cells[0].innerText);

		response
		"""
			webview.evaluateJavaScript(script) { (result, error) in
				doOnMainThread {
					completion(Result(result, error, as: [String: Any].self))
				}
			}
		}
	}
}

let tester1 = CodingBatQuestionTester()
tester1.load(url: URL(string: "https://codingbat.com/prob/p150113")!) { problemInfoResult in
	doOnMainThread {
		do {
			let problemInfo: CodingBatQuestionTester.ProblemInfo = try problemInfoResult.unwrap()
			print(problemInfo.initCode)
		} catch {
			print("Error:", error)
		}
	}
}
