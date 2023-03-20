//
//  NYSService.swift
//  NYCSchools
//
//  Created by Venkata K on 3/20/23.
//

import Foundation

/// Primary API service object to get NYSchools data
final class NYSServcie {
    
    /// Shared singleton interface
    static let shared = NYSServcie()
    
    /// Privatized constructor
    private init() {}
    
    enum NYSServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    private func request(from nyRequest: NYSRequest) -> URLRequest? {
        guard let url = nyRequest.url else {
            return nil
        }
        let request = URLRequest(url: url)
        return request
    }
    
    /// Send NYSchool API call
    /// - Parameters:
    ///   - request: request instace
    ///   - expecting: type we expect
    ///   - completion: callback with data or error
    public func execute<T: Codable>(
        _ request: NYSRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void)
    {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(NYSServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NYSServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
                print(result.self)
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
