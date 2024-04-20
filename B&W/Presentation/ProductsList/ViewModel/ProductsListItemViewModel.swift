import Foundation

class ProductsListItemViewModel: Equatable {
    static func == (lhs: ProductsListItemViewModel, rhs: ProductsListItemViewModel) -> Bool {
        lhs.name == rhs.name
    }
    
    var useCase: GetProductItemUseCase? = nil

    private var loadTask: Cancellable? { willSet { loadTask?.cancel() } }
    
    let name: String
    let price: String
    let description: String
    let imagePath: String
    let rating: Double
    var imageData: Data?
    
    func getImageData(completion: @escaping (Data) -> ()) {
        loadTask = useCase?.execute(requestValue: .init(path: imagePath), completion: { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(_):
                print("error")
            }
        })
    }
    
    init(product: Product? = nil) {
        self.name = product?.name ?? ""
        self.price = product?.price ?? ""
        self.description = product?.description ?? ""
        self.imagePath = product?.imagePath ?? ""
        self.rating = product?.rating ?? 0.0
    }
}
