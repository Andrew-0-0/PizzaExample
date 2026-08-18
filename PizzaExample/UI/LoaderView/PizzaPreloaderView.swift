//
//  LoaderView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct PizzaPreloaderView: View {
    @State var viewModel: PizzaPreloaderViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image("pizza\(viewModel.state.currentFrame)")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)

            Text("Loading...")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .onAppear {
            viewModel.startAnimation()
        }
        .onDisappear {
            viewModel.stopAnimation()
        }
    }
}


