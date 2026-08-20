//
//  SizePickerView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct SizePickerView: View {
    @Binding var selectedSize: PizzaSize

    var body: some View {
        HStack(spacing: 70) {
            ForEach(PizzaSize.allCases, id: \.self) { size in
                sizeButton(size)
                    .offset(y: size == .medium ? 40 : 0)
            }
        }
    }

    private func sizeButton(_ size: PizzaSize) -> some View {
        Button {
            selectedSize = size
        } label: {
            Text(size.rawValue)
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
