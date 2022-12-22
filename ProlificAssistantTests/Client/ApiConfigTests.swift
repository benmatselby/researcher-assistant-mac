//
//  ProlificAssistantTests.swift
//  ProlificAssistantTests
//
//  Created by Ben Selby on 23/11/2022.
//

import XCTest
@testable import ProlificAssistant

final class ProlificAssistantTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetApiUrlReturnsTheUrl() {
        let apiConfig = ApiConfig()
        XCTAssertEqual("https://api.prolific.co/api", apiConfig.getApiUrl())
    }
}
