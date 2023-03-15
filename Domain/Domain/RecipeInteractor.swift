//
//  RecipeInteractor.swift
//  Domain
//
//  Created by Clever Capa on 11-07-22.
//
import Data

public class RecipeInteractor: RecipeInteractorProtocol {
    public var repository: RecipeRepositoryProtocol?
    
    public init(repository: RecipeRepositoryProtocol) {
        self.repository = repository
    }
    
    public func fetchRecipe(completion: @escaping (RecipeResponse?) -> Void) {
        repository?.fetchRecipe(completion: completion)
    }
}
 
