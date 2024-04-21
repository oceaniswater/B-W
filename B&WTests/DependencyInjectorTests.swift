//
//  DependencyInjectorTests.swift
//  BloomTests
//
//  Created by Mark Golubev on 21/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import XCTest

@testable import Bloom
final class DependencyInjectorTests: XCTestCase {
    
    // MARK: - Mocks
    
    var dependencyContainer: DependencyContainer?

    override func setUpWithError() throws {
            let config = ApiRequestConfig(baseURL: URL(string: "https://my-json-server.typicode.com/daliad007/iOS-tech-test/")!)
            let apiDataNetwork = DefaultNetworkService(config: config)
            let apiDataTransferService = DefaultDataTransferService(with: apiDataNetwork)
            let dependencies = DependencyContainer.Dependencies(apiDataTransferService: apiDataTransferService)
            dependencyContainer = DependencyContainer(dependencies: dependencies)
    }

    override func tearDownWithError() throws {
        dependencyContainer = nil
    }

    // MARK: - Tests
    
    func test_DependencyInjectorTests_makeDataRepositoty() throws {
        let dataRepository = dependencyContainer?.makeDataRepository()
        
        XCTAssertNotNil(dataRepository)
    }
    
    func test_DependencyInjectorTests_makeGetImageDataUseCase() throws {
        let useCase = dependencyContainer?.makeGetImageDataUseCase()

        XCTAssertNotNil(useCase)
    }

    func test_DependencyInjectorTests_makeProductDetailsViewModel() throws {
        let mockProduct = Product(id: "1234", name: "Product", description: "Description", price: "£23.00", imagePath: "fjhjdhf", rating: 3.4)
        
        let vm = dependencyContainer?.makeProductDetailsViewModel(product: mockProduct)

        XCTAssertNotNil(vm)
        XCTAssertEqual(vm?.id, mockProduct.id)
    }
    
    func test_DependencyInjectorTests_makeProductDetailsViewController() throws {
        let mockProduct = Product(id: "1234", name: "Product", description: "Description", price: "£23.00", imagePath: "fjhjdhf", rating: 3.4)

        let vc: ProductDetailsViewControllerWrapper<DefaultProductDetailsViewModel> = dependencyContainer?.makeProductDetailsViewController(product: mockProduct) as! ProductDetailsViewControllerWrapper

        XCTAssertNotNil(vc)
    }
    
    func test_DependencyInjectorTests_makeGetProductDetailsFlowCoordinator() throws {
        let mockProduct = Product(id: "1234", name: "Product", description: "Description", price: "£23.00", imagePath: "fjhjdhf", rating: 3.4)

        let coordinator = dependencyContainer?.makeGetProductDetailsFlowCoordinator(product: mockProduct, navigationController: UINavigationController())

        XCTAssertNotNil(coordinator)
    }

}
