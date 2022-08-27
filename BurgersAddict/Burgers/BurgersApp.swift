//
//  BurgersApp.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import SwiftUI

@main
struct BurgersApp: App {
    var body: some Scene {
        WindowGroup {
            BurgersView(viewModel: BurgersViewModel())
        }
    }
}
