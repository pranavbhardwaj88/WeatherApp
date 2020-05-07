//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

struct ResponseContainer <T: Codable> {
    var responseObject: T?
    var error: Error?
}

protocol NetworkService {
    static func request<T: Codable>(type: T.Type, router: NetworkRouter, queryItems: [URLQueryItem]?, body: Data?, completion: @escaping ((ResponseContainer<T>)) -> ())
    static func parameter(parameterDictionary: [String:String]) -> [URLQueryItem]
}

extension NetworkService {
    static func request<T: Codable>(type: T.Type, router: NetworkRouter, queryItems: [URLQueryItem]? = nil, body: Data? = nil ,completion: @escaping ((ResponseContainer<T>)) -> ()) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = queryItems
        
        let session = URLSession(configuration: .default)
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        urlRequest.httpBody = body
            
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(T.self, from: data)
                completion(ResponseContainer(responseObject: responseObject, error: nil))
            } catch let error {
                completion(ResponseContainer(responseObject: nil, error: error))
            }
        }
        dataTask.resume()
    }
    
    static func parameter(parameterDictionary: [String:String]) -> [URLQueryItem] {
        var parameters: [URLQueryItem] = [URLQueryItem]()
        for (key, value) in parameterDictionary {
            parameters.append(URLQueryItem(name: key, value: value))
        }
        return parameters
    }
}
