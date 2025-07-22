import Testing

@Test("A global test function (defined in Suites.swift)")
func globalFunction() async throws {
    
}

struct UnannotatedSuite {
    struct UnannotatedSubSuite {
        struct UnannotatedSubSubSuite {
            @Test("testInSubSubSuite (defined in Suites.swift)")
            func testInSubSubSuite(){
                
            }
        }
        
        @Test("testInSubSuite (defined in Suites.swift)")
        func testInSubSuite(){
            
        }
    }
    
    @Test("testInTopLevelSuite (defined in Suites.swift)")
    func testInTopLevelSuite(){
        
    }
}

@Suite("Named suite") struct NamedSuites {
    @Suite("Named sub-suite") struct NamedSubSuite {
        @Suite("Named sub-sub-suite") struct NamedSubSubSuite {
            @Test("testInNamedSubSubSuite (defined in Suites.swift)")
            func testInNamedSubSubSuite(){
                
            }
        }
        
        @Test("testInNamedSubSuite (defined in Suites.swift)")
        func testInNamedSubSuite(){
            
        }
    }
    
    @Test("testInNamedTopLevelSuite (defined in Suites.swift)")
    func testInNamedTopLevelSuite(){
        
    }
}
