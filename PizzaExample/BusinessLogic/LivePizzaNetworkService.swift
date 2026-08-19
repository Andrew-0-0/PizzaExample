//
//  PizzaNetworkManager.swift
//  PizzaExample
//
//  Created by Andrew I on 19.08.2026.
//

import Foundation

protocol PizzaNetworkService {
    func fetchPizzas() async throws -> [Pizza]
}

final class LivePizzaNetworkService: PizzaNetworkService {
    private let urlString = "https://oursongapp.com/api/pizzas"
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchPizzas() async throws -> [Pizza] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        do {
            return try JSONDecoder().decode([Pizza].self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
