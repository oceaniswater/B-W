//
//  ProductDetailsViewControllerWrapper.swift
//  B&W
//
//  Created by Mark Golubev on 17/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import UIKit
import SwiftUI

/// A view controller wrapper for displaying product details using SwiftUI views.
class ProductDetailsViewControllerWrapper<VM: ProductDetailsViewModel>: UIViewController {
    
    private var viewModel: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func create(with viewModel: VM) -> ProductDetailsViewControllerWrapper {
        let view = ProductDetailsViewControllerWrapper()
        view.viewModel = viewModel
        return view
    }
}

// MARK: - Setup View

private extension ProductDetailsViewControllerWrapper {
    /// Sets up the view with SwiftUI hosting controller.
    func setupView() {
        title = viewModel.name
        
        let childView = UIHostingController(rootView: ProductDetailsView(vm: viewModel))
        addChild(childView)
        view.addSubview(childView.view)
        
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childView.view.topAnchor.constraint(equalTo: view.topAnchor),
            childView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
