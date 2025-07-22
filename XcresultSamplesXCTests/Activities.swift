import XCTest

final class Activities: XCTestCase {

    final class AllureApi: XCTestCase {
        func testDisplayName() throws {
            XCTContext.runActivity(named: "allure.name:This name was set by an activity", block: { _ in })
        }
        
        func testDescription() throws {
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
            XCTContext.runActivity(named: "allure.parameter.Excluded parameter with random value[excluded]:\(Int.random(in: 1..<100))", block: { _ in })
            XCTContext.runActivity(named: "allure.parameter.Masked and excluded parameter[masked,excluded]:\(Int.random(in: 1..<100))", block: { _ in })
        }
    }
    
    func testOnePassedActivity() throws {
        XCTContext.runActivity(named: "Step 1", block: { _ in })
    }
    
    func testOneActivityWithOneFailedAssertion() throws {
        XCTContext.runActivity(named: "Step 1") { _ in
            XCTAssertEqual("foo", "bar")
        }
    }
    
    func testOneActivityWithTwoFailedAssertions() throws {
        XCTContext.runActivity(named: "Step 1") { _ in
            XCTAssertEqual("foo", "bar")
            XCTAssertEqual("baz", "qux")
        }
    }
    
    func testOneActivityWithOneExpectedFailure() throws {
        XCTContext.runActivity(named: "Step 1") { _ in
            XCTExpectFailure("We expect a failure here")
            XCTAssertEqual("foo", "bar")
        }
    }
    
    func testOneActivityWithTwoExpectedFailures() throws {
        XCTContext.runActivity(named: "Step 1") { _ in
            XCTExpectFailure("We expect two failures here")
            XCTAssertEqual("foo", "bar")
            XCTAssertEqual("baz", "qux")
        }
    }
    
    func testThreeActivitiesWithExpectedAndUnexpectedFailures() throws {
        XCTContext.runActivity(named: "Step 1") { _ in
            XCTContext.runActivity(named: "Step 1.1") { _ in
                XCTExpectFailure("We expect a failure here")
                XCTAssertEqual("foo", "bar")
            }
            XCTContext.runActivity(named: "Step 1.2") { _ in
                XCTAssertEqual("baz", "qux")
            }
        }
    }
    
    func testFailureAggregation() throws {
        XCTAssertEqual("foo", "bar")
        XCTContext.runActivity(named: "Step 1") { _ in
            XCTAssertEqual("bar", "baz")
            XCTContext.runActivity(named: "Step 1.1") { _ in
                XCTAssertEqual("baz", "qux")
            }
        }
    }
    
    func testSixNestedSteps() throws {
        XCTContext.runActivity(named: "Step 1") { _ in
            XCTContext.runActivity(named: "Step 1.1") { _ in
                
            }
            XCTContext.runActivity(named: "Step 1.2") { _ in
                
            }
        }
        XCTContext.runActivity(named: "Step 2") { _ in
            XCTContext.runActivity(named: "Step 2.1") { _ in
                
            }
            XCTContext.runActivity(named: "Step 2.2") { _ in
                
            }
        }
    }
    
    func testTextAttachment() throws {
        XCTContext.runActivity(named: "Foo", block: { activity in
            let attachment = XCTAttachment(string: "Lorem Ipsum")
            attachment.name = "Bar"
            activity.add(attachment)
        })
    }
}
