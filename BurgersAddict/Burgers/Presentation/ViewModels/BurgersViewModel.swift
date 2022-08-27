//
//  BurgersViewModel.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import Foundation
import Combine

class BurgersViewModel: ObservableObject {
    @Published public var burgers: [Burger] = []

    private var burgerService: BurgerServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(burgers: [Burger] = [],
        burgerService: BurgerServiceProtocol = BurgersService()) {

        self.burgers = burgers
        self.burgerService = burgerService
    }

    public func onAppear() {
        self.getBurgers()
    }

    private func getBurgers() {
        burgerService.getBurgers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] burgers in
                self?.burgers = burgers
            }
            .store(in: &cancellables)
    }
}
