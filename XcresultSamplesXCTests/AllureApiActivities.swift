import XCTest

final class AllureApiActivities: XCTestCase {
    func testDisplayName() throws {
        XCTContext.runActivity(named: "allure.name:This name was set by an activity", block: { _ in })
    }
    
    func testDescription() throws {
        // Currently not rendered by Allure 3. See https://github.com/allure-framework/allure3/issues/211
        XCTContext.runActivity(named: "allure.description:This description was set by an activity", block: { _ in })
    }
    
    func testLabel() throws {
        XCTContext.runActivity(named: "allure.label.owner:John Doe", block: { _ in })
    }
    
    func testAllureId() throws {
        // Not visible in Allure 2. You may check the AS_ID label presence in the converted result file.
        // In Allure 3, the ALLURE_ID label should be visible on the test details page (AS_ID is a legacy name).
        XCTContext.runActivity(named: "allure.id:1004", block: { _ in })
    }
    
    func testLinks() throws {
        // No name, default type
        XCTContext.runActivity(named: "allure.link:https://allurereport.org", block: { _ in })
        
        // Named, default type
        XCTContext.runActivity(named: "allure.link.The documentation:https://allurereport.org/docs", block: { _ in })
        
        // No name, custom type
        XCTContext.runActivity(named: "allure.link[issue]:https://github.com/allure-framework/allure3/issues/2", block: { _ in })
        
        // Named, custom type
        XCTContext.runActivity(named: "allure.link.Add default values for readers #84[tms]:https://github.com/allure-framework/allure3/issues/2", block: { _ in })
        
        // If the name contains ':', '[', it must be encoded with encodeURIComponent
        XCTContext.runActivity(named: "allure.link.feat%3A%20xcresult%20reader%20%5B%2384%5D[tms]:https://github.com/allure-framework/allure3/pull/84", block: { _ in })
    }
    
    // New in Allure 3:
    
    // This is a shorthand for 'allure.link.<name>[issue]:<URL>'
    func testIssueLink() throws {
        // No name
        XCTContext.runActivity(named: "allure.issue:https://github.com/allure-framework/allure3/issues/2", block: { _ in })
        
        // Named
        XCTContext.runActivity(named: "allure.issue.Issue 2:https://github.com/allure-framework/allure3/issues/2", block: { _ in })
        
        // If the name contains ':', '[', it must be encoded with encodeURIComponent
        XCTContext.runActivity(named: "allure.issue.Add%20default%20values%20for%20readers%20%5B%232%5D:https://github.com/allure-framework/allure3/issues/2", block: { _ in })
    }
    
    // This is a shorthand for 'allure.link.<name>[tms]:<URL>'
    func testTmsItemLink() throws {
        // No name
        XCTContext.runActivity(named: "allure.tms:https://github.com/allure-framework/allure3/pull/84", block: { _ in })
        
        // Named
        XCTContext.runActivity(named: "allure.tms.PR #84:https://github.com/allure-framework/allure3/pull/84", block: { _ in })
        
        // If the name contains ':', '[', it must be encoded with encodeURIComponent
        XCTContext.runActivity(named: "allure.tms.feat%3A%20xcresult%20reader%20%5B%2384%5D:https://github.com/allure-framework/allure3/pull/84", block: { _ in })
    }
    
    func testPrecondition() throws {
        // Currently, not rendered in the report (but is present in the object model).
        XCTContext.runActivity(named: "allure.precondition:This precondition was set by an activity", block: { _ in })
    
    func testExpectedResult() throws {
        // Currently, not rendered in the report (but is present in the object model).
        XCTContext.runActivity(named: "allure.expectedResult:This expected result was set by an activity", block: { _ in })
    }
    }
    
    func testFlaky() throws {
        // Can also be allure.flaky:true
        XCTContext.runActivity(named: "allure.flaky", block: { _ in })
    }
    
    func testKnown() throws {
        // Can also be allure.known:true
        XCTContext.runActivity(named: "allure.known", block: { _ in })
    }
    
    func testMuted() throws {
        // Can also be allure.muted:true
        XCTContext.runActivity(named: "allure.muted", block: { _ in })
    }
    
    func testParameters() throws {
        XCTContext.runActivity(named: "allure.parameter.Regular parameter:Value 1", block: { _ in })
        XCTContext.runActivity(named: "allure.parameter.Masked parameter[masked]:Value 2", block: { _ in })
        XCTContext.runActivity(named: "allure.parameter.Hidden parameter[hidden]:Value 3", block: { _ in })
        
        // The effect of the 'excluded' property is better illustrated with a random value.
        // In a report with repetitions enabled, without 'excluded', each new value would result in a separate test rather than in retries of the same test.
        let randomValue = Int.random(in: 1..<100)
        XCTContext.runActivity(named: "allure.parameter.Excluded parameter with random value[excluded]:\(randomValue)", block: { _ in })
        XCTContext.runActivity(named: "allure.parameter.Masked and excluded parameter[masked,excluded]:\(randomValue)", block: { _ in })
    }
}
