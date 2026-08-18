//
//  AppFlowCoordinatorView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct AppFlowCoordinatorView: View {

    @State var viewModel: AppFlowCoordinatorViewModel

    var body: some View {

        ZStack {
            if viewModel.state.isLoading {
                PizzaPreloaderView(viewModel: viewModel.makePizzaPreloaderViewModel())
                    .transition(.opacity.combined(with: .scale(scale: 0.98)))
            } else {
                HomeView(viewModel: viewModel.makeHomeViewModel())
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.4), value: viewModel.state.isLoading)
        .task {
            await viewModel.fetchInitialData()
        }

    }

}

