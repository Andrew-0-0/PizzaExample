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

    struct State {
        var currentPizza: PizzaType = .midnightHarvest
        var selectedSize: PizzaSize = .medium
        var pizzas: [Pizza] = []
        var errorMessage: String? = nil
        var quantity: Int = 1
        var isZoomed = false
        var slideEdge: Edge = .trailing
        var currentZoom: CGFloat = 1.0
        var finalZoom: CGFloat = 1.0

        var zoomImageName: String {
            currentPizza.zoomImageName
        }

        var selectedPizza: Pizza? {
            pizzas.first { $0.name == currentPizza.rawValue }
        }

        // Price for 1 pizza of the selected size
        var unitPrice: Double {
            guard let pizza = selectedPizza else { return 0.0 }
            return pizza.price(for: selectedSize)
        }

        // Calculated total price based on size and quantity
        var totalPrice: Double {
            unitPrice * Double(quantity)
        }
    }

    private(set) var state: State
    private let appEnvironment: AppEnvironment

    init(
        state: State,
        appEnvironment: AppEnvironment
    ) {
        self.state = state
        self.appEnvironment = appEnvironment
    }

    func loadPizzas() async {
        do {
            state.pizzas = try await appEnvironment.networkService.fetchPizzas()
        } catch {
            state.errorMessage = error.localizedDescription
        }
    }

    func setSlideEdge(_ edge: Edge) {
            state.slideEdge = edge
        }

    // MARK: - Zoom Actions
    func zoomIn() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            state.isZoomed = true
        }
    }

    func dismissZoom() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            state.isZoomed = false
            state.currentZoom = 1.0
            state.finalZoom = 1.0
        }
    }

    func updateZoomScale(_ magnification: CGFloat) {
        let newScale = state.finalZoom * magnification
        state.currentZoom = min(max(newScale, 0.8), 3.0)
    }

    func finalizeZoomScale() {
        state.finalZoom = state.currentZoom
        if state.currentZoom < 1.0 {
            dismissZoom()
        }
    }

    func incrementQuantity() {
        state.quantity += 1
    }

    func decrementQuantity() {
        if state.quantity > 1 {
            state.quantity -= 1
        }
    }

    func addToCart() {
        // Implement add to cart logic
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

        guard let currentIndex = pizzas.firstIndex(of: state.currentPizza)
        else {
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
        guard let currentIndex = pizzas.firstIndex(of: state.currentPizza)
        else {
            return pizzas[0]
        }
        let previousIndex = (currentIndex - 1 + pizzas.count) % pizzas.count
        return pizzas[previousIndex]
    }

    var previousPizzaImageName: String {
        previousPizza.imageName(for: state.selectedSize)
    }
}
