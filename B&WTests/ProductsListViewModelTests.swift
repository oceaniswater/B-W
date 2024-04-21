import XCTest

@testable import Bloom
class ProductsListViewModelTests: XCTestCase {
    
    // MARK: - Mocks
    
    class MockProductsUseCase: GetProductsUseCase {
        var products: Products?
        
        init(products: Products? = nil) {
            self.products = products
        }
        
        func execute(requestValue: GetProductsUseCaseRequestValue, completion: @escaping (Result<Products, any Error>) -> Void) -> (any Cancellable)? {
            let products = products!
            completion(.success(products))
            return nil
        }
    }
    
    class MockGetImageDataUseCase: GetImageDataUseCase {
        func execute(requestValue: GetProductItemUseCaseValue, completion: @escaping (Result<Data, any Error>) -> Void) -> (any Cancellable)? {
            return nil
        }
    }
    
    // MARK: - Tests

    func test_ProductsListViewModel_loadProducts_success() throws {
        let expectedProducts = Products(products: [Product(id: "123", name: "Product1", description: "Description", price: "£23.00", imagePath: "http://jknjnv.com/123", rating: 2.9),
                                                   Product(id: "124", name: "Product2", description: "Description2", price: "£123.00", imagePath: "http://jknjnv.com/1234", rating: 3.9)])
        
        let mockGetProductsUseCase = MockProductsUseCase(products: expectedProducts)
        let mockGetImageDataUseCase = MockGetImageDataUseCase()
        let vm = DefaultProductsListViewModel(useCase: mockGetProductsUseCase, productItemUseCase: mockGetImageDataUseCase)
        
        XCTAssertEqual(vm.products.count, 0)
        XCTAssertEqual(vm.items.value.count, 0)
        
        vm.viewDidLoad()

        XCTAssertEqual(vm.products.count, expectedProducts.products.count)
        XCTAssertEqual(vm.items.value.count, expectedProducts.products.count)

    }
}
