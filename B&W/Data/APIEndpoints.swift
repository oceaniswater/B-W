import Foundation

struct APIEndpoints {

    static func getProducts() -> Endpoint<ProductResponseDTO> {
        return Endpoint(path: "db",
                        method: .get)
    }
    
    static func getImageData(path: String) -> Endpoint<Data> {
        return Endpoint(path: path,
                        isFullPath: true,
                        method: .get)
    }
}
