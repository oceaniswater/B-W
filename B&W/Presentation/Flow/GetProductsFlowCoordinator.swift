import UIKit

protocol GetProductsFlowCoordinatorDependencies {
    func makeProductsListViewController(actions: ProductsListViewModelActions) -> ProductsListViewController
    func makeProductDetailsViewController(product: Product) -> ProductDetailsViewControllerWrapper
}

final class GetProductsFlowCoordinator {

    private weak var tabBarController: UITabBarController?
    private weak var navigationController: UINavigationController?
    private let dependencies: GetProductsFlowCoordinatorDependencies

    private weak var productsListVC: ProductsListViewController?

    init(tabBarController: UITabBarController,
         navigationController: UINavigationController,
         dependencies: GetProductsFlowCoordinatorDependencies) {
        self.tabBarController = tabBarController
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let actions = ProductsListViewModelActions(showProductDetails: showProductDetails)
        let shopVC = dependencies.makeProductsListViewController(actions: actions)

        let navVC = UINavigationController(rootViewController: shopVC)

        tabBarController?.viewControllers = [navVC]
        productsListVC = shopVC
    }

    private func showProductDetails(product: Product) {
        guard let navigationController = productsListVC?.navigationController else { return }
        let productsDetailsDependencies = AppDependenciesContainer().makeProductsDetailsDependenciesContainer()
        let flow = productsDetailsDependencies.makeGetProductDetailsFlowCoordinator(product: product, navigationController: navigationController)
        flow.start()
    }
}
