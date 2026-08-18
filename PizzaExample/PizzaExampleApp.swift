//
//  PizzaExampleApp.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

@main
struct PianoReaderApp: App {
    @State var viewModel: AppFlowCoordinatorViewModel

    init() {
        let initialState = AppFlowCoordinatorViewModel.State()

        _viewModel = State(
            initialValue: AppFlowCoordinatorViewModel(
                state: initialState,

            )
        )
    }

    var body: some Scene {
        WindowGroup {
            AppFlowCoordinatorView(viewModel: viewModel)
                .preferredColorScheme(.light)
        }
    }
}
