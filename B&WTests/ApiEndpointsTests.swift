//
//  ApiEndpointsTests.swift
//  BloomTests
//
//  Created by Mark Golubev on 21/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import XCTest

@testable import Bloom
final class ApiEndpointsTests: XCTestCase {

    func test_ApiEndpointsTests_getImageData() throws {
        let expectedPath = "http://apple.com/"
        let isFullPath = true
        let method: HTTPMethodType = .get
        
        let endpoint = APIEndpoints.getImageData(path: expectedPath)
        
        XCTAssertEqual(endpoint.path, expectedPath)
        XCTAssertEqual(endpoint.isFullPath, isFullPath)
        XCTAssertEqual(endpoint.method, method)
    }
}
