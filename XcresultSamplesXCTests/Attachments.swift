import XCTest

final class Attachments: XCTestCase {
    func testTextAttachment() throws {
        XCTContext.runActivity(named: "allure.description:The attachment is visible in the 'Multiple destinations' report only", block: { _ in })
        let attachment = XCTAttachment(string: "Lorem Ipsum")
        attachment.name = "A text attachment"
        self.add(attachment)
    }
    
    func testUnnamedAttachment() throws {
        XCTContext.runActivity(named: "allure.description:The attachment is visible in the 'Multiple destinations' report only", block: { _ in })
        let attachment = XCTAttachment(string: "Lorem Ipsum")
        self.add(attachment)
    }
    
    func testMultipleUnnamedAttachments() throws {
        XCTContext.runActivity(named: "allure.description:The attachments are visible in the 'Multiple destinations' report only", block: { _ in })
        let attachment1 = XCTAttachment(string: "Lorem Ipsum")
        self.add(attachment1)
        
        let attachment2 = XCTAttachment(string: "Dolor Sit Amet")
        self.add(attachment2)
    }
}
