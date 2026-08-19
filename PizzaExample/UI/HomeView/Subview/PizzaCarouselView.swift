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

    var body: some View {
        ZStack {
            // Previous Pizza (Left)
            Button(action: onPreviousPizza) {
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

            // Next Pizza (Right)
            Button(action: onNextPizza) {
                Image(nextImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
            }
            .buttonStyle(.plain)
            .offset(x: 210)
        }
        .frame(maxWidth: .infinity) // Allows side buttons space to render without getting clipped
    }
}
