import Foundation

struct ProductsListItemViewModel: Equatable {
    let name: String
    let price: String
    let description: String
    let imagePath: String
    let rating: Double
}

extension ProductsListItemViewModel {
    init(product: Product) {
        self.name = product.name ?? ""
        self.price = product.price ?? ""
        self.description = product.description ?? ""
        self.imagePath = product.imagePath ?? ""
        self.rating = product.rating ?? 0.0
    }
}
