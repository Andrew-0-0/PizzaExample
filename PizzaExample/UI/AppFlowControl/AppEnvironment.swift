//
//  AppEnvironment.swift
//  PizzaExample
//
//  Created by Andrew I on 19.08.2026.
//

import SwiftUI

@MainActor
struct AppEnvironment {

    let networkService: any PizzaNetworkService
    // add more services and managers for future dependency injection

}

extension AppEnvironment {

    static func make() -> Self {
        let networkService = LivePizzaNetworkService()

        return .init(

            networkService: networkService
        )
    }
}
