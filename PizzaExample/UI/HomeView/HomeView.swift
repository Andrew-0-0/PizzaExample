//
//  ContentView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

        ZStack {
            Image(.ellipse)
                .resizable()
                .ignoresSafeArea()
                .padding(.bottom, 300)
        }

    }
}

#Preview {
    HomeView()
}
