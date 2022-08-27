//
//  BurgersService.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import Foundation
import Combine

protocol BurgerServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }

    func getBurgers() -> AnyPublisher<[Burger], Error>
}

/// the BurgersService depends on the Networker component.
class BurgersService: BurgerServiceProtocol {

    let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }

    func getBurgers() -> AnyPublisher<[Burger], Error> {
        let endpoint = Endpoint.burgers
        return networker.get(type: [Burger].self,
                             url: endpoint.url,
                             headers: endpoint.headers)
    }


}
