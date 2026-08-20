//
//  NetworkError.swift
//  PizzaExample
//
//  Created by Andrew I on 19.08.2026.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
}
