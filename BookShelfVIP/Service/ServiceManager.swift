//
//  ServiceManager.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 26/06/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
}

enum ServiceManagerError: Error {
    case decodedError
    case network(Error?)
}

final class ServiceManager {
    
    private let baseURL: URL
    private let urlSession: URLSession
    
    init(base: String, urlSession: URLSession = .shared) throws {
        guard let url = URL(string: base) else  {
            throw NetworkError.invalidURL
        }
        self.urlSession = urlSession
        self.baseURL = url
    }
    
    func get<T: Decodable>(path: String, type: T.Type = T.self, callback: @escaping (Result<T, ServiceManagerError>) -> Void) {
        var url = baseURL
        url.append(path: path)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = urlSession.dataTask(with: request) { data, responde, error in
            if let error = error {
                DispatchQueue.main.async {
                    callback(.failure(.network(error)))
                }
            }
            
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        callback(.success(json))
                    }
                } catch (let err) {
                    DispatchQueue.main.async {
                        callback(.failure(.decodedError))
                        print(err)
                    }
                }
            }
        }
        task.resume()
    }
}
