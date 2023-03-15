//
//  RecipeRepositoryProtocol.swift
//  Data
//
//  Created by Clever Capa on 12-07-22.
//

public protocol RecipeRepositoryProtocol {
    func fetchRecipe(completion: @escaping (RecipeResponse?)-> Void)
}
