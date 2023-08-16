//
//  DataTransferService.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import Foundation

enum DataTransferError: Error {
    case noResponse
    case parsingJSON
    case networkFailure(NetworkError)
}

final class DataEndpoint<T: Any>: Endpoint { }

protocol DataTransferService {
    func request<T: Decodable>(with endpoint: DataEndpoint<T>, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask?
}

class DataTransferServiceImpl: DataTransferService {
    
    @Injected(\.networkService) var networkService: NetworkService
    
    func request<T: Decodable>(with endpoint: DataEndpoint<T>, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask? {
        return networkService.request(endpoint: endpoint) { result in
            switch result {
            case .success(let responseData):
                guard let responseData = responseData else {
                    DispatchQueue.main.async { completion(Result.failure(DataTransferError.noResponse)) }
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: responseData)
                    DispatchQueue.main.async { completion(.success(result)) }
                } catch {
                    DispatchQueue.main.async { completion(Result.failure(DataTransferError.parsingJSON)) }
                }
            case .failure(let error):
                DispatchQueue.main.async { completion(Result.failure(DataTransferError.networkFailure(error))) }
            }
        }
    }
    
}
