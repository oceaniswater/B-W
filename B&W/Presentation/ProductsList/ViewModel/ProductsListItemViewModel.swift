import Foundation

class ProductsListItemViewModel: Equatable {
    static func == (lhs: ProductsListItemViewModel, rhs: ProductsListItemViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    private var useCase: GetImageDataUseCase
    private var loadTask: Cancellable? { willSet { loadTask?.cancel() } }
    
    let id: Product.Identifier
    let name: String
    let price: String
    let description: String
    let imagePath: String
    let rating: Double
    var imageData: Data?
    
    /// Fetches the image data for the product.
    func getImageData(completion: @escaping (Data) -> ()) {
        loadTask = useCase.execute(requestValue: .init(path: imagePath), completion: { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(_):
                print("error")
            }
        })
    }
    
    init(product: Product, useCase: GetImageDataUseCase) {
        self.id = product.id
        self.name = product.name ?? ""
        self.price = product.price ?? ""
        self.description = product.description ?? ""
        self.imagePath = product.imagePath ?? ""
        self.rating = product.rating ?? 0.0
        self.useCase = useCase
    }
}
