//
//  BurgerViewModel.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import Foundation

struct BurgerCellViewModel {
    let ref: String
    let title: String
    let description: String
    let thumbnail: URL
    let price: Float

    func getPrice() -> String {
        if price > 0 {
            let convertedPrice = price / 100
            return String(format: "%.2f €", convertedPrice)
        }
        return ""
    }
}
