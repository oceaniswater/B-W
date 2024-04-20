//
//  DefaultDataRepository.swift
//  B&W
//
//  Created by Mark Golubev on 18/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

final class DefaultDataRepository {

    private let dataTransferService: DataTransferService

    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultDataRepository: DataRepository {

    public func fetchData(path: String,
                                completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable? {

        let task = RepositoryTask()

        guard !task.isCancelled else { return nil}

        let endpoint = APIEndpoints.getImageData(path: path)
        task.networkTask = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
}
