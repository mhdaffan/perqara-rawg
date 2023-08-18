//
//  DataTransferServiceMockImpl.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import Foundation
@testable import PerqaraRAWG

class DataTransferServiceMockImpl: DataTransferService {
    
    var response: (Result<Data?, Error>) = .failure(DataTransferError.parsingJSON)
    
    func request<T: Decodable>(with endpoint: DataEndpoint<T>, completion: @escaping (Result<T, Error>) -> Void) {
        switch response {
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
            DispatchQueue.main.async { completion(Result.failure(DataTransferError.networkFailure(NetworkError.requestError(error)))) }
        }
    }
    
}
