//
//  HomeViewModel.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

@Observable
@MainActor
final class HomeViewModel {

   nonisolated struct State {
        var currentPizza: PizzaType = .pepperoni
        var selectedSize: PizzaSize = .medium
    }

    private(set) var state: State

    init(state: State = State()) {
        self.state = state
    }

    // Intent Handlers
    func selectSize(_ size: PizzaSize) {
        state.selectedSize = size
    }

    func selectPizza(_ pizza: PizzaType) {
        state.currentPizza = pizza
    }

    // Display Helpers
    var currentPizzaImageName: String {
        state.currentPizza.imageName(for: state.selectedSize)
    }

    var currentDimension: CGFloat {
        state.selectedSize.dimension
    }
}
