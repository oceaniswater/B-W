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
    
    // MARK: - Mocks
    
    class MockGetImageDataUseCase: GetImageDataUseCase {
        var imageData: Data?
        
        init(imageData: Data? = nil) {
            self.imageData = imageData
        }
        
        func execute(requestValue: GetProductItemUseCaseValue, completion: @escaping (Result<Data, any Error>) -> Void) -> (any Cancellable)? {
            if let imageData = imageData {
                completion(.success(imageData))
            } else {
                completion(.failure(NSError(domain: "500", code: 500)))
            }
            return nil
        }
    }
    
    // MARK: - Tests

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
    
    func test_ProductDetailsViewModel_getImageData() throws {
        let expectedImageData = UIImage(named: "placeholder")?.pngData()
        let mockProduct = Product(id: "123", name: "Product1", description: "Description", price: "£23.00", imagePath: "sjkjfjksjf", rating: 2.3)
        let mockUseCase = MockGetImageDataUseCase(imageData: expectedImageData)
        let vm = DefaultProductDetailsViewModel(product: mockProduct, useCase: mockUseCase)
        
        XCTAssertEqual(vm.imageData, nil)
        
        vm.getImageData()
        
        XCTAssertEqual(vm.imageData, expectedImageData)
    }
}
