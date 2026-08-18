//
//  Binding.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

extension Binding {
    @MainActor
    static func binding<T: Sendable>(get value: T, set: @MainActor @Sendable @escaping (_: T) -> Void) -> Binding<T> {
        .init(get: { value }, set: { val in set(val) })
    }
}

