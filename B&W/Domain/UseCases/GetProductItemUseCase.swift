//
//  GetProductItemUseCase.swift
//  B&W
//
//  Created by Mark Golubev on 18/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

protocol GetProductItemUseCase {
    func execute(requestValue: GetProductItemUseCaseValue,
                 completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}

final class DefaultGetProductItemUseCase: GetProductItemUseCase {

    private let dataRepository: DataRepository

    init(dataRepository: DataRepository) {

        self.dataRepository = dataRepository
    }

    func execute(requestValue: GetProductItemUseCaseValue,
                 completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable? {

        return dataRepository.fetchData(path: requestValue.path,
                                                completion: { result in
            completion(result)
        })
    }
}

struct GetProductItemUseCaseValue {
    let path: String
}
