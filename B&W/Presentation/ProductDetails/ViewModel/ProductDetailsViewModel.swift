//
//  ProductDetailsViewModel2.swift
//  B&W
//
//  Created by Mark Golubev on 17/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import SwiftUI

/// A protocol defining the properties and methods required for a product details view model.
protocol ProductDetailsViewModel: ObservableObject {
    var name: String? { get set }
    var imagePath: String? { get set }
    var price: String? { get set }
    var description: String? { get set }
    var rating: Decimal? { get set }
    var imageData: Data? { get set }
    
    /// Fetches the image data for the product.
    func getImageData()
}

class DefaultProductDetailsViewModel: ProductDetailsViewModel, ObservableObject {
    @Published var name: String?
    @Published var imagePath: String?
    @Published var price: String?
    @Published var description: String?
    @Published var rating: Decimal?
    @Published var imageData: Data?
    var id: Product.Identifier
    
    private var useCase: GetImageDataUseCase?
    private var loadTask: Cancellable? { willSet { loadTask?.cancel() } }
    
    init(product: Product, useCase: GetImageDataUseCase? = nil) {
        self.name = product.name
        self.imagePath = product.imagePath ?? ""
        self.price = product.price
        self.description = product.description ?? ""
        self.rating = Decimal(product.rating ?? 0.0)
        self.id = product.id
        self.useCase = useCase
    }
    
    func getImageData() {
        guard let imagePath = imagePath else { return }
        loadTask = useCase?.execute(requestValue: .init(path: imagePath), completion: { [self] result in
            switch result {
            case .success(let data):
                imageData = data
            case .failure(_):
                print("error")
            }
        })
    }
}
