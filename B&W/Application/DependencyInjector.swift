import Foundation
import UIKit

final class DependencyContainer {

    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Use Cases

    func makeGetProductsUseCase() -> GetProductsUseCase {
        return DefaultGetProductsUseCase(productsRepository: makeProductsRepository())
    }
    
    /// Factory method to create a GetImageDataUseCase instance.
    func makeGetImageDataUseCase() -> GetImageDataUseCase {
        // Create and return an instance of DefaultGetImageDataUseCase,
        // passing a data repository obtained from the dependency container.
        return DefaultGetImageDataUseCase(dataRepository: makeDataRepository())
    }

    // MARK: - Repositories

    func makeProductsRepository() -> ProductsRepository {
        return DefaultProductsRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    /// Factory method to create a DataRepository instance.
    func makeDataRepository() -> DataRepository {
        // Create and return an instance of DefaultDataRepository,
        // passing the DataTransferService instance obtained from the dependency container.
        return DefaultDataRepository(dataTransferService: dependencies.apiDataTransferService)
    }

    // MARK: - Controllers

    func makeProductsListViewController(actions: ProductsListViewModelActions) -> ProductsListViewController {
        return ProductsListViewController.create(with: makeProductsListViewModel(actions: actions))
    }

    /// Factory method to create a ProductDetailsViewControllerWrapper instance with a specific view model type.
    func makeProductDetailsViewController<VM: ProductDetailsViewModel>(product: Product) -> ProductDetailsViewControllerWrapper<VM> {
        return ProductDetailsViewControllerWrapper<VM>.create(with: makeProductDetailsViewModel(product: product) as! VM)
    }

    // MARK: - View Models
    
    /// Factory method to create a ProductsListViewModel instance.
    func makeProductsListViewModel(actions: ProductsListViewModelActions) -> ProductsListViewModel {
        // Create and return an instance of DefaultProductsListViewModel,
        // passing the GetProductsUseCase and GetImageDataUseCase instances obtained from the dependency container,
        // along with the provided actions.
        return DefaultProductsListViewModel(useCase: makeGetProductsUseCase(), productItemUseCase: makeGetImageDataUseCase(),
                                          actions: actions)
    }

    /// Factory method to create a ProductDetailsViewModel instance.
    func makeProductDetailsViewModel(product: Product) -> DefaultProductDetailsViewModel {
        // Create and return an instance of DefaultProductDetailsViewModel,
        // passing the provided product and the GetImageDataUseCase instance obtained from the dependency container.
        return DefaultProductDetailsViewModel(product: product, useCase: makeGetImageDataUseCase())
    }

    // MARK: - Flow Coordinators
    func makeGetProductsFlowCoordinator(tabBarController: UITabBarController, navigationController: UINavigationController) -> GetProductsFlowCoordinator {
        return GetProductsFlowCoordinator(tabBarController: tabBarController, navigationController: navigationController,
                                          dependencies: self)
    }
    
    func makeGetProductDetailsFlowCoordinator(product: Product, navigationController: UINavigationController) -> GetProductDetailsFlowCoordinator {
        return GetProductDetailsFlowCoordinator(product: product, navigationController: navigationController, dependencies: self)
    }
}

extension DependencyContainer: GetProductsFlowCoordinatorDependencies, GetProductDetailsFlowCoordinatorDependencies {}
