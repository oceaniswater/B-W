import Foundation

struct Product: Equatable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let name: String?
    let description: String?
    let price: String?
    let imagePath: String?
    let rating: Double?
}

struct Products: Equatable {
    let products: [Product]
}
