//
//  PizzaCarouselView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct PizzaCarouselView: View {

    let currentImageName: String
    let nextImageName: String
    let currentDimension: CGFloat

    let onNextPizza: () -> Void

    var body: some View {
        ZStack {

            // Next pizza
            Button {
                onNextPizza()
            } label: {
                Image(nextImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
            }
            .buttonStyle(.plain)
            .offset(x: 210)

            // Current pizza
            Image(currentImageName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: currentDimension,
                    height: currentDimension
                )
        }
        .clipped()
    }
}
