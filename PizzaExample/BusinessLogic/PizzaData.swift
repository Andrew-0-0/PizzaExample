//
//  PizzaData.swift
//  PizzaExample
//
//  Created by Andrew I on 19.08.2026.
//

import Foundation

struct Pizza: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let price: Double
    let size: String

    enum CodingKeys: String, CodingKey {
        case title, description, price, size
    }
}
