//
//  ProductDetailsViewModel2.swift
//  B&W
//
//  Created by Mark Golubev on 17/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

protocol ProductDetailsViewModel: ObservableObject {
    var product: Product? { get set }
}

class DefaultProductDetailsViewModel: ProductDetailsViewModel {
    @Published var product: Product?
    
    init(product: Product) {
        self.product = product
    }
}

class AnyProductDetailsViewModel: ProductDetailsViewModel {
    private let _product: () -> Product?
    private let _setProduct: (Product?) -> Void

    var product: Product? {
        get { _product() }
        set { _setProduct(newValue) }
    }

    init<VM: ProductDetailsViewModel>(_ viewModel: VM) {
        _product = { viewModel.product }
        _setProduct = { viewModel.product = $0 }
    }
}
