//
//  PizzaExampleApp.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

@main
struct PizzaExampleApp: App {
    @State var viewModel: AppFlowCoordinatorViewModel

    init() {
        let initialState = AppFlowCoordinatorViewModel.State()
        let appEnvironment = AppEnvironment.make()

        _viewModel = State(
            initialValue: AppFlowCoordinatorViewModel(
                state: initialState,
                appEnvironment: appEnvironment,

            )
        )
    }

    var body: some Scene {
        WindowGroup {
            AppFlowCoordinatorView(viewModel: viewModel)
        }
    }
}
