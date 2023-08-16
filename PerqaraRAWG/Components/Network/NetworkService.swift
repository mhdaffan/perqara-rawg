//
//  NetworkService.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import Foundation

enum NetworkError: Error {
    case errorStatusCode(statusCode: Int)
    case notConnected
    case cancelled
    case urlGeneration
    case requestError(Error?)
}

extension NetworkError {
    var isNotFoundError: Bool {
        return hasCodeError(404)
    }
    
    func hasCodeError(_ codeError: Int) -> Bool {
        switch self {
        case let .errorStatusCode(code):
            return code == codeError
        default: return false
        }
    }
}

protocol NetworkService {
    @discardableResult
    func request(endpoint: Requestable, completion: @escaping (Result<Data?, NetworkError>) -> Void) -> URLSessionDataTask?
}

protocol NetworkSession {
    func loadData(
        from request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: NetworkSession {
    
    func loadData(from request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = dataTask(with: request) { (data, response, error) in
            completionHandler(data, response, error)
        }
        task.resume()
        return task
    }
    
}

class NetworkServiceImpl: NetworkService {
    
    @Injected(\.networkConfiguration) var config: NetworkConfigurable
    
    func request(endpoint: Requestable, completion: @escaping (Result<Data?, NetworkError>) -> Void) -> URLSessionDataTask? {
        do {
            let urlRequest = try endpoint.urlRequest(with: config)
            let sessionDataTask = URLSession.shared.loadData(from: urlRequest) { (data, response, requestError) in
                var error: NetworkError
                if let requestError = requestError {
                    if let response = response as? HTTPURLResponse, (400..<600).contains(response.statusCode) {
                        error = .errorStatusCode(statusCode: response.statusCode)
                    } else if requestError._code == NSURLErrorNotConnectedToInternet {
                        error = .notConnected
                    } else if requestError._code == NSURLErrorCancelled {
                        error = .cancelled
                    } else {
                        error = .requestError(requestError)
                    }
                    completion(.failure(error))
                } else {
                    completion(.success(data))
                }
            }
            sessionDataTask.resume()
            return sessionDataTask
        } catch {
            completion(.failure(NetworkError.urlGeneration))
            return nil
        }
    }
    
}
