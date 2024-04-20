//
//  ProuctDetailsViewModelTests.swift
//  BnWTests
//
//  Created by Mark Golubev on 20/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import XCTest

@testable import Bloom
final class ProuctDetailsViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ProductDetailsViewModel_createdWithValidProduct() throws {
        let expectedName = "Product2"
        let expectedDescription = "Description"
        let expectedPrice = "£123.00"
        let expectedImagePath = "https://example.com/123"
        let expectedRating = 1.5
        
        
        let product = Product(id: "123", name: expectedName, description: expectedDescription, price: expectedPrice, imagePath: expectedImagePath, rating: expectedRating)
        let vm = DefaultProductDetailsViewModel(product: product)
        
        XCTAssertEqual(expectedName, vm.name)
        XCTAssertEqual(expectedDescription, vm.description)
        XCTAssertEqual(expectedPrice, vm.price)
        XCTAssertEqual(expectedImagePath, vm.imagePath)
        XCTAssertEqual(Decimal(expectedRating), vm.rating)
    }
    
    func test_AnyProductDetailsViewModel_createdWithValidVM() throws {
        let expectedName = "Product2"
        let expectedDescription = "Description"
        let expectedPrice = "£123.00"
        let expectedImagePath = "https://example.com/123"
        let expectedRating = 1.5
        
        
        let product = Product(id: "123", name: expectedName, description: expectedDescription, price: expectedPrice, imagePath: expectedImagePath, rating: expectedRating)
        let vm = DefaultProductDetailsViewModel(product: product)
        let wrapper = AnyProductDetailsViewModel(vm)
        
        XCTAssertEqual(expectedName, wrapper.name)
        XCTAssertEqual(expectedDescription, wrapper.description)
        XCTAssertEqual(expectedPrice, wrapper.price)
        XCTAssertEqual(expectedImagePath, wrapper.imagePath)
        XCTAssertEqual(Decimal(expectedRating), wrapper.rating)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
