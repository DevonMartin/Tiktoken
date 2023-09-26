import XCTest
@testable import Tiktoken

final class TiktokenTests: XCTestCase {
    
    func testGivenGPT4WhenDecodeThenMatch() async throws {
//        let input = "Esto es un texto 👨🏻‍💻 con emojis diferentes 🍿💃🏼🧜‍ y más texto que no tiene sentido 🛟"
//        let expected = [14101, 78, 1560, 653, 33125, 62904, 101, 9468, 237, 119, 378, 235, 93273, 119, 390, 100166, 46418, 11410, 235, 123, 93273, 225, 9468, 237, 120, 9468, 100, 250, 378, 235, 379, 11158, 33125, 1744, 912, 24215, 65484, 11410, 249, 253]
        
        let input = "這個算法真的太棒了"
        let expected = [11589, 247, 20022, 233, 70203, 25333, 89151, 9554, 8192, 103, 77062, 240, 35287]
        
		let encoding = await Tiktoken.encode(input)
        let output = try XCTUnwrap(encoding)
        XCTAssertEqual(output, expected)
    }
}
