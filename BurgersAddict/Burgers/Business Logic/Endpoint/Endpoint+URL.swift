//
//  Endpoint+URL.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import Foundation

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "uad.io"
        components.path = "/bigburger/" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }

    var headers: [String: Any] {
        return [:]
    }
}
