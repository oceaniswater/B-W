import Foundation

struct APIEndpoints {

    static func getProducts() -> Endpoint<ProductResponseDTO> {
        return Endpoint(path: "db",
                        method: .get)
    }
    
    /// Creates an endpoint for fetching image data from a given path.
    /// - Parameter path: The path to the image data.
    /// - Returns: An `Endpoint` object representing the request to fetch image data.
    static func getImageData(path: String) -> Endpoint<Data> {
        return Endpoint(path: path,
                        isFullPath: true,
                        method: .get)
    }
}
