//
//  PizzaSize.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

// MARK: - Models

enum PizzaSize: String, CaseIterable {
    case small = "S"
    case medium = "M"
    case large = "L"

    var dimension: CGFloat {
        switch self {
        case .small: return 200
        case .medium: return 250
        case .large: return 300
        }
    }
}

enum PizzaType: String, CaseIterable, Identifiable {
    case pepperoni = "Pepperoni"
    case shrimptastic = "Shrimptastic"
    case midnightHarvest = "Midnight Harvest"

    var id: String { rawValue }

    func imageName(for size: PizzaSize) -> String {
        let prefix: String
        switch self {
        case .pepperoni:
            prefix = "pepperoni"
        case .shrimptastic:
            prefix = "shrimptastic"
        case .midnightHarvest:
            prefix = "midnightHarvest"
        }

        switch size {
        case .small: return "\(prefix)Small"
        case .medium: return "\(prefix)Medium"
        case .large: return "\(prefix)Large"
        }
    }
}
