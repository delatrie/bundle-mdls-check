import Testing

extension Tag {
    @Tag static var fromSuite: Self
    @Tag static var fromSubSuite: Self
    @Tag static var fromTest: Self
}

@Suite(.tags(.fromSuite)) struct Tags {

    @Suite(.tags(.fromSubSuite)) struct SubSuite {
        @Test(.tags(.fromTest)) func hasTagsFromBothSuitesAndTest() {
            
        }
        
        @Test func hasTagsFromSuitesOnly() {
            
        }
    }
    
    @Test(.tags(.fromTest)) func hasTagsFromOneSuiteAndTest() {
        
    }
    
    @Test func hasTagsFromOneSuiteOnly() {
        
    }
}
