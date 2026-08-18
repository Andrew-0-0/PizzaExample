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

    struct State {

        var isLoading = true

    }

    private(set) var state: State

    init(state: State) {
        self.state = state

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
        .init(state: .init())
    }

}
