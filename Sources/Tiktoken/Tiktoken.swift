import Foundation

public struct Tiktoken {
	
	private static var encoding: Encoding?
	
	private static let url = "https://openaipublic.blob.core.windows.net/encodings/cl100k_base.tiktoken"
	private static let pattern = "/(?i:'s|'t|'re|'ve|'m|'ll|'d)|[^\\r\\n\\p{L}\\p{N}]?\\p{L}+|\\p{N}{1,3}| ?[^\\s\\p{L}\\p{N}]+[\\r\\n]*|\\s*[\\r\\n]+|\\s+(?!\\S)|\\s+/gu"
	private static let specialTokens = [
		"<|endoftext|>": 100257,
		"<|fim_prefix|>": 100258,
		"<|fim_middle|>": 100259,
		"<|fim_suffix|>": 100260,
		"<|endofprompt|>": 100276
	]
    
	public static func count(_ string: String) async -> Int {
		return await encode(string).count
	}
	
	static func encode(_ string: String) async -> [Int] {
		guard let encoding else {
			let encoder = await Load.loadTiktokenBpe(url: url)
			let regex = try! NSRegularExpression(pattern: pattern)
			let encoding = Encoding(regex: regex, mergeableRanks: encoder, specialTokens: specialTokens)
			self.encoding = encoding
			return await encode(string)
		}
		
		return encoding.encode(value: string)
	}
    
    private init() {}
}
