import Testing

struct Bugs {

    @Test(.bug(id: "2"))
    func bugIdOnly() async throws {
    }
    
    @Test(.bug("https://github.com/allure-framework/allure3/issues/2", id: "2"))
    func bugUrlAndId() async throws {
    }
    
    @Test(.bug("https://github.com/allure-framework/allure3/issues/2"))
    func bugUrlOnly() async throws {
    }
    
    @Test(.bug("https://github.com/allure-framework/allure3/issues/2", "Issue #2"))
    func bugUrlAndName() async throws {
    }
    
    @Test(.bug("https://github.com/allure-framework/allure3/issues/2", id: "2", "Issue #2"))
    func bugUrlNameAndId() async throws {
    }
}
