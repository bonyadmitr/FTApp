import XCTest
@testable import FTApp

class FTAppTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(FTApp().text, "Hello, World!")
    }


    static var allTests : [(String, (FTAppTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
