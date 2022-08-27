//
//  Burger.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import Foundation

/*
 "ref": "1",
 "title": "The Big Burger",
 "description": "Un classique mais tellement bon.",
 "thumbnail": "https://uad.io/bigburger/images/1.png",
 "price": 92820
 */

/// A struct  for the Burger entity model
struct Burger: Codable {
    let ref: String
    let title: String
    let description: String
    let thumbnail: String
    let price: Float

}
