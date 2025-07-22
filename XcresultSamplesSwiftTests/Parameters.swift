import Testing

struct Parameters {
    
    @Test(arguments: ["foo", "bar"])
    func oneParameterNoLabel(_ value: String) async throws {
    }
    
    @Test(arguments: ["foo", "bar"])
    func oneParameterWithLabel(Label value: String) async throws {
    }
    
    @Test(arguments: ["foo", "bar"], [1, 2])
    func twoParametersNoLabels(_ text: String, _ count: Int) async throws {
    }
    
    @Test(arguments: ["foo", "bar"], [1, 2])
    func twoParametersWithLabels(Foo text: String, Bar count: Int) async throws {
    }
}
