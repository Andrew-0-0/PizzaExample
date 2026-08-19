//
//  PizzaSize.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

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
    case midnightHarvest = "Midnight Harvest"
    case pepperoni = "Pepperoni"
    case shrimptastic = "Shrimptastic"

    var id: String { rawValue }

    // Dynamic prefix for asset naming
    var assetPrefix: String {
        switch self {
        case .midnightHarvest: return "midnightHarvest"
        case .pepperoni: return "pepperoni"
        case .shrimptastic: return "shrimptastic"
        }
    }

    // Full pizza display name
    func imageName(for size: PizzaSize) -> String {
        switch size {
        case .small: return "\(assetPrefix)Small"
        case .medium: return "\(assetPrefix)Medium"
        case .large: return "\(assetPrefix)Large"
        }
    }

    // Dedicated side preview image names
    var nextImageName: String {
        "\(assetPrefix)Next"
    }

    var previousImageName: String {
        "\(assetPrefix)Previous"
    }
}

