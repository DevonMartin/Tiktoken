import Foundation

public class Tiktoken {
	
	private let coder: Encoding
	
	private let url = "https://openaipublic.blob.core.windows.net/encodings/cl100k_base.tiktoken"
	private let pattern = "/(?i:'s|'t|'re|'ve|'m|'ll|'d)|[^\\r\\n\\p{L}\\p{N}]?\\p{L}+|\\p{N}{1,3}| ?[^\\s\\p{L}\\p{N}]+[\\r\\n]*|\\s*[\\r\\n]+|\\s+(?!\\S)|\\s+/gu"
	private let specialTokens = [
		"<|endoftext|>": 100257,
		"<|fim_prefix|>": 100258,
		"<|fim_middle|>": 100259,
		"<|fim_suffix|>": 100260,
		"<|endofprompt|>": 100276
	]
	
	public init() async {
		let encoder = await Load.loadTiktokenBpe(url: url)
		let regex = try! NSRegularExpression(pattern: pattern)
		let encoding = Encoding(regex: regex, mergeableRanks: encoder, specialTokens: specialTokens)
		self.coder = encoding
	}
    
	/// Counts the number of tokens in a given text string.
	///
	/// This function is designed to provide an estimate of the number of tokens that will be consumed in an API call. It works by 
	/// tokenizing the input text string and summing up the token counts.
	///
	/// - Parameter text: The input text string to tokenize. This should be a concatenation of all the messages, roles, and other 
	/// elements that will be part of the API payload.
	///
	/// ## Example
	/// ```swift
	/// var concatenatedMessages = ""
	/// for message in messages {
	///     let role = "role: " + message.role  // system, user or assistant
	///     let content = "content: " + message.content
	///
	///     // Include both role and content, separated by spaces
	///     concatenatedMessages += "\(role) \(content) "
	/// }
	///
	/// // Now count tokens for the whole string
	/// let tiktoken = await Tiktoken()
	/// let count = tiktoken.count(concatenatedMessages)
	/// print("Estimate: \(count)")
	/// ```
	///
	/// - Returns: An `Int` representing the estimated number of tokens in the input text.
	public func count(_ string: String) -> Int {
		encode(string).count
	}
	
	func encode(_ string: String) -> [Int] {
		coder.encode(value: string)
	}
}
