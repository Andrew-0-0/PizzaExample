//
//  PizzaData.swift
//  PizzaExample
//
//  Created by Andrew I on 19.08.2026.
//

import Foundation

struct PizzaResponse: Codable {
    let pizzas: [Pizza]
}

struct Pizza: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let variants: [Variant]
    let defaultSize: String

    struct Variant: Codable {
        let size: String
        let price: Double
    }

    enum CodingKeys: String, CodingKey {
        case id, name, description, variants
        case defaultSize = "default_size"
    }

    func price(for size: PizzaSize) -> Double {
           variants.first { $0.size.lowercased() == size.rawValue.lowercased() }?.price
               ?? variants.first(where: { $0.size == defaultSize })?.price
               ?? variants.first?.price
               ?? 0.0
       }
}
