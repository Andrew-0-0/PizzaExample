//
//  SizePickerView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct SizePickerView: View {
    @Binding var selectedSize: String

    var body: some View {
        HStack(spacing: 70) {
            sizeButton("S")

            sizeButton("M")
                .offset(y: 40)

            sizeButton("L")
        }
    }

    private func sizeButton(_ size: String) -> some View {
        Button {
            selectedSize = size
        } label: {
            Text(size)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(
                    selectedSize == size ? .white : .primary
                )
                .frame(width: 60, height: 60)
                .background {
                    Circle()
                        .fill(selectedSize == size ? .black : .white)
                }
                .shadow(radius: 8)
        }
        .buttonStyle(.plain)
    }
}
