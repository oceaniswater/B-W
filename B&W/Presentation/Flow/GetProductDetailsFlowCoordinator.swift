//
//  GetProductDetailsFlowCoordinator.swift
//  B&W
//
//  Created by Mark Golubev on 19/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import UIKit

protocol GetProductDetailsFlowCoordinatorDependencies {
    func makeProductDetailsViewController(product: Product) -> ProductDetailsViewControllerWrapper
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

    func start() {
        let vc = dependencies.makeProductDetailsViewController(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
}
