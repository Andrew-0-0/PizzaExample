//
//  AppFlowCoordinatorViewModel.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

@Observable
@MainActor
final class AppFlowCoordinatorViewModel {

   nonisolated struct State {

        var isLoading = true

    }

    struct Environment {
        let networkService: PizzaNetworkService
    }


    private(set) var state: State
    private let appEnvironment: AppEnvironment

    init(state: State,
         appEnvironment: AppEnvironment) {
        self.state = state
        self.appEnvironment = appEnvironment
    }

    func fetchInitialData() async {
        // Replace this timer with your real network call or database fetch
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        state.isLoading = false
    }

    func makePizzaPreloaderViewModel() -> PizzaPreloaderViewModel {
        .init(state: .init())
    }

    func makeHomeViewModel() -> HomeViewModel {
        .init(
            state: .init(), appEnvironment: appEnvironment,

        )
    }
}
