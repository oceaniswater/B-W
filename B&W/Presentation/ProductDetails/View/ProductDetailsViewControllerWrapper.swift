//
//  ProductDetailsViewControllerWrapper.swift
//  B&W
//
//  Created by Mark Golubev on 17/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import UIKit
import SwiftUI

class ProductDetailsViewControllerWrapper: UIViewController {
        
    private var viewModel: AnyProductDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.product?.name

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
    
    static func create(with viewModel: DefaultProductDetailsViewModel) -> ProductDetailsViewControllerWrapper {
        let view = ProductDetailsViewControllerWrapper()
        view.viewModel = AnyProductDetailsViewModel(viewModel)
        return view
    }
}
