//
//  GetProductDetailsFlowCoordinator.swift
//  B&W
//
//  Created by Mark Golubev on 19/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import UIKit

protocol GetProductDetailsFlowCoordinatorDependencies {
    func makeProductDetailsViewController<VM: ProductDetailsViewModel>(product: Product) -> ProductDetailsViewControllerWrapper<VM>
}

final class GetProductDetailsFlowCoordinator {

    private weak var navigationController: UINavigationController?
    private let dependencies: GetProductDetailsFlowCoordinatorDependencies

    private let product: Product

    init(product: Product,
         navigationController: UINavigationController,
         dependencies: GetProductDetailsFlowCoordinatorDependencies) {
        self.product = product
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    /// Initiates the flow for presenting the product details screen.
    ///
    /// - Note: This method is responsible for starting the flow for displaying the details of a product.
    ///
    /// - Important: This method must be called to initiate the product details flow.
    ///
    /// - Warning: Ensure that the navigation controller is set before calling this method to avoid runtime errors.
    ///
    /// - Precondition: The dependencies object must be properly configured to provide the necessary dependencies.
    func start() {
        let vc: ProductDetailsViewControllerWrapper<DefaultProductDetailsViewModel> = dependencies.makeProductDetailsViewController(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
}
