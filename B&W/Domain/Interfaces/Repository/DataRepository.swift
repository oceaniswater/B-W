//
//  DataRepository.swift
//  B&W
//
//  Created by Mark Golubev on 18/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

protocol DataRepository {
    func fetchData(path: String,
                           completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
