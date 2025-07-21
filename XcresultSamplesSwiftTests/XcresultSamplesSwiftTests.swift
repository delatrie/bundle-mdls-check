//
//  XcresultSamplesSwiftTests.swift
//  XcresultSamplesSwiftTests
//
//  Created by Maksim Stepanov on 17.07.2025.
//

import Testing

struct XcresultSamplesSwiftTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test func slow() async throws {
        try await Task.sleep(for: .seconds(1))
    }

}
