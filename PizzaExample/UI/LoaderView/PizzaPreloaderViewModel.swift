//
//  PizzaPreloaderViewModel.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

@Observable
@MainActor
final class PizzaPreloaderViewModel {

    nonisolated struct State {
        let totalFrames = 8
        let frameDuration = 0.45
        var timer: Timer?
        var currentFrame = 1

    }

    private(set) var state: State

    init(state: State) {
        self.state = state

    }

    func startAnimation() {

        state.timer = Timer.scheduledTimer(withTimeInterval: state.frameDuration, repeats: true) { [weak self] _ in
            guard let self else { return }
            Task { @MainActor in
                if self.state.currentFrame < self.state.totalFrames {
                    self.state.currentFrame += 1
                } else {
                    self.state.currentFrame = 1
                }
            }
        }
        RunLoop.main.add(state.timer!, forMode: .common)
    }

    func stopAnimation() {
        state.timer?.invalidate()
        state.timer = nil
    }
}
