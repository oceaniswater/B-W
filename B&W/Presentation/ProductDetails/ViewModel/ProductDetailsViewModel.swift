//
//  ProductDetailsViewModel2.swift
//  B&W
//
//  Created by Mark Golubev on 17/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

protocol ProductDetailsViewModel: ObservableObject {
    var name: String? { get set }
    var imagePath: String? { get set }
    var price: String? { get set }
    var description: String? { get set }
    var rating: Decimal? { get set }
}

class DefaultProductDetailsViewModel: ProductDetailsViewModel {
    @Published var name: String?
    @Published var imagePath: String?
    @Published var price: String?
    @Published var description: String?
    @Published var rating: Decimal?
    
    init(product: Product) {
        self.name = product.name
        self.imagePath = product.imagePath ?? ""
        self.price = product.price
        self.description = product.description ?? ""
        self.rating = Decimal(product.rating ?? 0.0)
    }
    
}

// MARK: - ProductDetailsViewModel wrapper

class AnyProductDetailsViewModel: ProductDetailsViewModel {
    private let _name: () -> String?
    private let _setName: (String?) -> Void
    private let _imagePath: () -> String?
    private let _setImagePath: (String?) -> Void
    private let _price: () -> String?
    private let _setPrice: (String?) -> Void
    private let _description: () -> String?
    private let _setDescription: (String?) -> Void
    private let _rating: () -> Decimal?
    private let _setRating: (Decimal?) -> Void

    var name: String? {
        get { _name() }
        set { _setName(newValue) }
    }
    
    var imagePath: String? {
        get { _imagePath() }
        set { _setImagePath(newValue) }
    }
    
    var price: String? {
        get { _price() }
        set { _setPrice(newValue) }
    }
    
    var description: String? {
        get { _description() }
        set { _setDescription(newValue) }
    }
    
    var rating: Decimal? {
        get { _rating() }
        set { _setRating(newValue) }
    }

    init<VM: ProductDetailsViewModel>(_ viewModel: VM) {
        _name = { viewModel.name }
        _setName = { viewModel.name = $0 }
        _imagePath = { viewModel.imagePath }
        _setImagePath = { viewModel.imagePath = $0 }
        _price = { viewModel.price }
        _setPrice = { viewModel.price = $0 }
        _description = { viewModel.description }
        _setDescription = { viewModel.description = $0 }
        _rating = { viewModel.rating }
        _setRating = { viewModel.rating = $0 }
    }
}
