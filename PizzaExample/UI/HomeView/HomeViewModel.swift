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
        var currentPizza: PizzaType = .midnightHarvest
        var selectedSize: PizzaSize = .medium
    }

    private(set) var state: State

    init(state: State = State()) {
        self.state = state
    }

    func selectSize(_ size: PizzaSize) {
        state.selectedSize = size
    }

    func selectPizza(_ pizza: PizzaType) {
        state.currentPizza = pizza
    }

    var currentPizzaImageName: String {
        state.currentPizza.imageName(for: state.selectedSize)
    }

    var currentDimension: CGFloat {
        state.selectedSize.dimension
    }

    var nextPizza: PizzaType {
        let pizzas = PizzaType.allCases

        guard let currentIndex = pizzas.firstIndex(of: state.currentPizza) else {
            return pizzas[0]
        }

        let nextIndex = (currentIndex + 1) % pizzas.count
        return pizzas[nextIndex]
    }

    var nextPizzaImageName: String {
        nextPizza.imageName(for: state.selectedSize)
    }

    var previousPizza: PizzaType {
        let pizzas = PizzaType.allCases
        guard let currentIndex = pizzas.firstIndex(of: state.currentPizza) else {
            return pizzas[0]
        }
        let previousIndex = (currentIndex - 1 + pizzas.count) % pizzas.count
        return pizzas[previousIndex]
    }

    var previousPizzaImageName: String {
        previousPizza.imageName(for: state.selectedSize)
    }
}
