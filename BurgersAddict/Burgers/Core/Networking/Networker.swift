//
//  Networker.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
}

protocol NetworkerProtocol: AnyObject {
    typealias Headers = [String: Any]

    func get<T>(type: T.Type,
                url: URL,
                headers: Headers) -> AnyPublisher<T, Error> where T: Decodable
}

/// Working with URLSession and returning a Publisher containing decoded Codable models

class Networker: NetworkerProtocol {

    func get<T>(type: T.Type,
                url: URL,
                headers: Headers) -> AnyPublisher<T, Error> where T : Decodable {

        var urlRequest = URLRequest(url: url)

        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
