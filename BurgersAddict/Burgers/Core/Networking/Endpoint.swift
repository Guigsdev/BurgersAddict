//
//  Endpoint.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import Foundation

/// This layer contains the Endpoint struct to be used later in the business logic layer for the creation of specific REST API base URLs and endpoint

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}
