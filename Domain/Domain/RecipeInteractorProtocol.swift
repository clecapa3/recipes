//
//  RecipeInteractorProtocol.swift
//  Data
//
//  Created by Clever Capa on 11-07-22.
//

import Data

public protocol RecipeInteractorProtocol {
    var repository: RecipeRepositoryProtocol? {get set}
    func fetchRecipe(completion: @escaping (RecipeResponse?) -> Void)
}
