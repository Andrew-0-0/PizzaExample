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
            Button(action: onPreviousPizza) {
                Image(previousImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
            }
            .buttonStyle(.plain)
            .offset(x: -210)

            Image(currentImageName)
                .resizable()
                .scaledToFit()
                .frame(width: currentDimension, height: currentDimension)

            Button(action: onNextPizza) {
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
