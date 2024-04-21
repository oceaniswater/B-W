//
//  ProductsListItemViewModelTests.swift
//  BloomTests
//
//  Created by Mark Golubev on 21/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import XCTest

@testable import Bloom
final class ProductsListItemViewModelTests: XCTestCase {
    
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
    
    func test_ProductsListItemViewModel_getImageData_succes() throws {
        let expectedImageData = UIImage(named: "placeholder")?.pngData()
        let mockProduct = Product(id: "123", name: "Product1", description: "Description", price: "£23.00", imagePath: "sjkjfjksjf", rating: 2.3)
        let mockUseCase = MockGetImageDataUseCase(imageData: expectedImageData)
        let vm = ProductsListItemViewModel(product: mockProduct, useCase: mockUseCase)
        
        var currentData: Data?
        
        vm.getImageData { data in
            currentData = data
        }
        
        XCTAssertEqual(currentData, expectedImageData)
    }
    
    func test_ProductsListItemViewModel_getImageData_failed() throws {
        let mockProduct = Product(id: "123", name: "Product1", description: "Description", price: "£23.00", imagePath: "sjkjfjksjf", rating: 2.3)
        let mockUseCase = MockGetImageDataUseCase()
        let vm = ProductsListItemViewModel(product: mockProduct, useCase: mockUseCase)
        
        var currentData: Data?
        
        vm.getImageData { data in
            currentData = data
        }
        
        XCTAssertEqual(currentData, nil)
    }
}
