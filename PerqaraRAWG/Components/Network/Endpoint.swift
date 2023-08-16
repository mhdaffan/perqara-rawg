//
//  Endpoint.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import Foundation

enum HTTPMethodType: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

class Endpoint: Requestable {
    var path: String
    var isFullPath: Bool = false
    var method: HTTPMethodType = .get
    var queryParameters: [String: Any] = [:]
    var headerParamaters: [String: String] = [:]
    var bodyParamaters: [String : Any] = [:]
    
    init(path: String,
         isFullPath: Bool = false,
         method: HTTPMethodType = .get,
         queryParameters: [String: Any] = [:],
         headerParamaters: [String: String] = [:],
         bodyParamaters: [String : Any] = [:]) {
        self.path = path
        self.isFullPath = isFullPath
        self.method = method
        self.queryParameters = queryParameters
        self.headerParamaters = headerParamaters
        self.bodyParamaters = bodyParamaters
    }
}

protocol Requestable {
    var path: String { get }
    var isFullPath: Bool { get }
    var method: HTTPMethodType { get }
    var queryParameters: [String: Any] { get }
    var headerParamaters: [String: String] { get }
    var bodyParamaters: [String: Any] { get }
    func urlRequest(with networkConfig: NetworkConfigurable) throws -> URLRequest
}

enum RequestGenerationError: Error {
    case components
}

extension Requestable {
    
    func configureUrl(with config: NetworkConfigurable) throws -> URL {
        let baseURL = config.baseURL.absoluteString.last != "/" ? config.baseURL.absoluteString + "/" : config.baseURL.absoluteString
        let endpoint = isFullPath ? path : baseURL.appending(path)
        
        guard var urlComponents = URLComponents(string: endpoint) else {
            throw RequestGenerationError.components
        }
        
        var urlQueryItems = [URLQueryItem]()
        
        queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }
        config.queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
        
        guard let url = urlComponents.url else {
            throw RequestGenerationError.components
        }
        
        return url
    }
    
    
    func urlRequest(with config: NetworkConfigurable) throws -> URLRequest {
        let url = try self.configureUrl(with: config)
        var urlRequest = URLRequest(url: url)
        var allHeaders: [String: String] = config.headers
        headerParamaters.forEach({ allHeaders.updateValue($1, forKey: $0) })
        
        if !bodyParamaters.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyParamaters)
        }
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = allHeaders
        
        return urlRequest
    }
    
}

fileprivate extension Dictionary {
    var queryString: String {
        return self.map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""
    }
}

protocol NetworkConfigurable {
    var baseURL: URL { get }
    var headers: [String: String] { get }
    var apiKey: String? { get }
    var queryParameters: [String: String] { get }
}

struct NetworkConfiguration: NetworkConfigurable {
    let baseURL: URL
    let headers: [String: String]
    let apiKey: String?
    var queryParameters: [String: String] {
        guard let apiKey = apiKey else {
            return [:]
        }
        return ["key": apiKey]
    }
    
    init(baseURL: URL, headers: [String: String] = [:], apiKey: String? = nil) {
        self.baseURL = baseURL
        self.headers = headers
        self.apiKey = apiKey
    }
}
