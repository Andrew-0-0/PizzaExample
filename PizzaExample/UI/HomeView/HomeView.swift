//
//  ContentView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct HomeView: View {

    @State var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            Image(.ellipse)
                .resizable()
                .ignoresSafeArea()
                .padding(.bottom, 300)

            PizzaCarouselView(
                currentImageName: viewModel.currentPizzaImageName,
                previousImageName: viewModel.previousPizzaImageName,
                nextImageName: viewModel.nextPizzaImageName,
                currentDimension: viewModel.currentDimension,
                onPreviousPizza: {
                    viewModel.selectPizza(viewModel.previousPizza)
                },
                onNextPizza: {
                    viewModel.selectPizza(viewModel.nextPizza)
                }
            )
            .animation(
                .spring(response: 0.4, dampingFraction: 0.7),
                value: viewModel.state.currentPizza
            )

            .padding(.bottom, 350)

            Image(.banana)

            SizePickerView(
                selectedSize: .binding(
                    get: viewModel.state.selectedSize,
                    set: { newSize in
                        viewModel.selectSize(newSize)
                    }
                )
            )
            .offset(y: 50)
        }
        .toolbar { toolbarItems }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
    }

    @ToolbarContentBuilder
    var toolbarItems: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                // Back action
            } label: {
                Image(systemName: "chevron.left")
            }
        }

        ToolbarItem(placement: .principal) {
            Text(viewModel.state.currentPizza.rawValue)
                .font(.title)
                .bold()
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                // Like action
            } label: {
                Label("Like", systemImage: "heart")
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        HomeView(viewModel: HomeViewModel())
    }
}
