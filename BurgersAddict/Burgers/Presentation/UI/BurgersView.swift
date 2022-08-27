//
//  BurgersView.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import SwiftUI

struct BurgersView: View {

    @ObservedObject var listViewModel: BurgersViewModel

    private func configureAppearance() {
        let navColor = UIColor(displayP3Red: 22/255, green: 32/255, blue: 53/255, alpha: 1.0)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: navColor
        ]
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: navColor
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance

        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().tintColor = .white
    }

    init(viewModel: BurgersViewModel) {
        self.listViewModel = viewModel
        configureAppearance()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(listViewModel.burgers.indices, id: \.self) { index in
                    let burger = listViewModel.burgers[index]
                    let cellViewModel = BurgerCellViewModel(ref: burger.ref, title: burger.title, description: burger.description, thumbnail: URL(string: burger.thumbnail)!, price: burger.price)
                    BurgerCell(viewModel: cellViewModel)
                }
            }
            .navigationTitle("Burger's Addict")
            .background(Color(red: 22/255, green: 32/255, blue: 53/255).ignoresSafeArea())
        }
        .onAppear(perform: {
            loadBurgers()
        })
        .edgesIgnoringSafeArea(.vertical)
    }

    func loadBurgers() {
        listViewModel.onAppear()
    }
}

struct BurgersView_Previews: PreviewProvider {
    static var previews: some View {
        BurgersView(viewModel: BurgersViewModel())
    }
}
