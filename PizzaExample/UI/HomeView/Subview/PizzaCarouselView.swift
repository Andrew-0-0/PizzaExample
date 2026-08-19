//
//  PizzaCarouselView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct PizzaCarouselView: View {
    let currentImageName: String
    let previousImageName: String
    let nextImageName: String
    let currentDimension: CGFloat
    let onPreviousPizza: () -> Void
    let onNextPizza: () -> Void

    // Tracks slide direction for transitions
    @State private var slideEdge: Edge = .trailing

    var body: some View {
        ZStack {
            // Previous Pizza (Left)
            Button {
                slideEdge = .leading
                onPreviousPizza()
            } label: {
                Image(previousImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
            }
            .buttonStyle(.plain)
            .offset(x: -210)

            // Current Pizza (Center)
            Image(currentImageName)
                .resizable()
                .scaledToFit()
                .frame(width: currentDimension, height: currentDimension)
                .id(currentImageName) // Triggers insertion/removal transition
                .transition(
                    .asymmetric(
                        insertion: .move(edge: slideEdge).combined(with: .opacity),
                        removal: .move(edge: slideEdge == .trailing ? .leading : .trailing).combined(with: .opacity)
                    )
                )

            // Next Pizza (Right)
            Button {
                slideEdge = .trailing
                onNextPizza()
            } label: {
                Image(nextImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
            }
            .buttonStyle(.plain)
            .offset(x: 210)
        }
        .frame(maxWidth: .infinity)
    }
}
