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

            VStack {
                Image(viewModel.currentPizzaImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: viewModel.currentDimension, height: viewModel.currentDimension)

                    .animation(.spring(response: 0.4, dampingFraction: 0.7), value: viewModel.state.selectedSize)
            }
            .padding(.bottom, 350)

                Image(.banana)
                
                SizePickerView(
                    selectedSize: .binding(
                        get: viewModel.state.selectedSize,
                        set: { newSize in viewModel.selectSize(newSize) }
                    )
                )
                .offset(y: 50)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}

