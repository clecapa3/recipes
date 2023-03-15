//
//  RecipeResponse.swift
//  Data
//
//  Created by Clever Capa on 12-07-22.
//

import Foundation

// MARK: - RecipeResponse
public struct RecipeResponse: Codable {
    public let recipes: [Recipe]

    public init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}
