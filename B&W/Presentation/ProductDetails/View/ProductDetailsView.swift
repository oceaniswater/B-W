//
//  ProductDetailsView.swift
//  B&W
//
//  Created by Mark Golubev on 17/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct ProductDetailsView<VM: ProductDetailsViewModel>: View {
    
    @ObservedObject var vm: VM
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ImageView(imageData: $vm.imageData)
                    .scaledToFit()
                    .frame(minHeight: 200, idealHeight: 250, maxHeight: 300)
                    .accessibilityHidden(false)
                    .accessibilityLabel("Product image")
               
                FiveStarView(rating: vm.rating ?? 0.0, color: .yellow, backgroundColor: Color(uiColor: UIColor.systemGray5), type: .full)
                    .frame(minWidth: 1, idealWidth: 200, maxWidth: 300, minHeight: 1, idealHeight: 16, maxHeight: 30, alignment: .center)
                    .accessibilityLabel("Product rating: \(vm.rating ?? 0.0)")
                
                Text(vm.price ?? "£0.00")
                    .font(.headline)
                    .accessibilityLabel("Price \(vm.price ?? "£0.00")")
                
                Text(vm.description ?? "")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .accessibilityLabel("Product description: \(vm.description ?? "")")
            }
            .padding()
        }
        .task {
            // Load the image data asynchronously when the view appears.
            vm.getImageData()
        }
    }
}

// MARK: - ImageView

struct ImageView: View {
    @Binding var imageData: Data?
    var body: some View {
        if let imageData = imageData {
            if let image = UIImage(data: imageData) {
                // Display the product image if available
                Image(uiImage: image)
                    .resizable()
            } else {
                // Display the placeholder image if data is invalid
                Image("placeholder")
                    .resizable()
            }
        } else {
            // Display a progress view if the image data is being loaded.
            ProgressView()
        }
    }
}

#Preview {
    let useCase = AppDependenciesContainer().makeProductsDetailsDependenciesContainer().makeGetImageDataUseCase()
    return ProductDetailsView(vm: DefaultProductDetailsViewModel(product: Product(id: "123",
                                                                           name: "Product",
                                                                           description:
                                                                            """
                                                                            A home lab typically refers to a setup where
                                                                            individuals create a small-scale environment for
                                                                            testing, learning, and experimenting with various
                                                                            technologies. Home labs are common among IT
                                                                            professionals, enthusiasts, and students who want
                                                                            to gain hands-on experience with different
                                                                            hardware and software solutions.
                                                                            Home labs can include a variety of components,
                                                                            such as servers, network equipment, storage
                                                                            devices, and virtualization platforms. They
                                                                            provide a safe and controlled environment for
                                                                            testing new technologies, practicing skills, and
                                                                            developing expertise without the constraints of a
                                                                            production environment.
                                                                            Some common use cases for home labs include
                                                                            learning about virtualization, networking, server
                                                                            administration, cybersecurity, and other
                                                                            IT-related disciplines. Home labs can range from
                                                                            simple setups with a few computers to more
                                                                            complex configurations with dedicated server
                                                                            racks and specialized hardware.
                                                                            """,
                                                                            price: "£20.00",
                                                                            imagePath: "https://picsum.photos/200/300",
                                                                            rating: 3.6), useCase: useCase))
}
