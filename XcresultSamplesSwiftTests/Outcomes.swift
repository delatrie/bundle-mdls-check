import Testing

struct Outcomes {
    
    @Test
    func passed() async throws {
        #expect(1 + 1 == 2)
    }
    
    @Test(.disabled("This description was provided via the disabled trait"))
    func skippedTestWithDescription() async throws {
        
    }
    
    @Test(.disabled())
    func skippedTestWithoutDescription() async throws {
        
    }
    
    @Test
    func oneFailedAssertion() async throws {
        #expect(1 + 1 == 3)
    }
    
    @Test
    func twoFailedAssertions() async throws {
        #expect(1 + 1 == 3)
        #expect(2 + 2 == 5)
    }
    
    @Test
    func uncaughtException() async throws {
        throw MyError.runtimeError("Lorem Ipsum")
    }
}
