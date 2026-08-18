//
//  ContentView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedSize = "M"
    var body: some View {

        ZStack {
            Image(.ellipse)
                .resizable()
                .ignoresSafeArea()
                .padding(.bottom, 300)
            Image(.banana)
            SizePickerView(selectedSize: $selectedSize)

                 .offset(y: 50)
        }
    }
}

#Preview {
    HomeView()
}
