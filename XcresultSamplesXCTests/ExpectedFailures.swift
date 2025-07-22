import XCTest

final class ExpectedFailures: XCTestCase {
    func testOneExpectedFailureWithNoMessage() throws {
        XCTExpectFailure()
        XCTAssertEqual("foo", "bar")
    }
    
    func testOneExpectedFailureWithMessage() throws {
        XCTExpectFailure("This message was set via XCTExpectFailure")
        XCTAssertEqual("foo", "bar")
    }
    
    func testTwoExpectedFailures() throws {
        XCTExpectFailure()
        XCTAssertEqual("foo", "bar")
        XCTAssertEqual("baz", "qux")
    }
    
    func testUnmetExpectedFailure() throws {
        XCTExpectFailure()
        XCTAssertEqual("foo", "foo")
    }
    
    func testMixOfMetAndUnmetExpectedFailures() throws {
        XCTExpectFailure()
        XCTAssertEqual("foo", "bar")
        XCTAssertEqual("baz", "baz")
        XCTAssertEqual("baz", "qux")
        XCTAssertEqual("qux", "qux")
    }
}
