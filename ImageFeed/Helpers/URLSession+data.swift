//
//  URLSession+data.swift
//  ImageFeed
//
//  Created by Pavel Popov on 11.03.2024.
//

import Foundation

//MARK: - NetworkError
enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
}

//MARK: - URLSession
extension URLSession {
    func data(
        for request: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionTask {
        let fulfillCompletionOnTheMainThread: (Result<Data, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        let task = dataTask(with: request, completionHandler: { data, response, error in
            if let data = data, let response = response, let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if 200 ..< 300 ~= statusCode {
                    fulfillCompletionOnTheMainThread(.success(data))
                } else {
                    fulfillCompletionOnTheMainThread(.failure(NetworkError.httpStatusCode(statusCode)))
                    print("HTTP Error: \(String(describing: error))")
                }
            } else if let error = error {
                fulfillCompletionOnTheMainThread(.failure(NetworkError.urlRequestError(error)))
                print("URLRequest Error: \(error)")
            } else {
                fulfillCompletionOnTheMainThread(.failure(NetworkError.urlSessionError))
                print("URLSession Error")
            }
        })
        
        return task
    }
}

