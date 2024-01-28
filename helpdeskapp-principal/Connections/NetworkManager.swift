//
//  NetworkManager.swift
//  helpdeskapp-principal
//
//  Created by Arlid Henao Rueda on 27/01/24.
//

import Combine
import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func request<T: Decodable>(request: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
