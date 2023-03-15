//
//  RecipeRemoteRepository.swift
//  Data
//
//  Created by Clever Capa on 12-07-22.
//
import Alamofire

public class RecipeRemoteRepository: RecipeRepositoryProtocol {
    
    public init() {}
    
    public func fetchRecipe(completion: @escaping (RecipeResponse?)-> Void) {
        AF.request(EndPoints.recipes.value,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil).responseDecodable(of: RecipeResponse.self) { response in
            debugPrint(response)
            if let recipeResponse = response.value {
                completion(recipeResponse)
            } else {
                completion(nil)
            }
        }
    }
}
 
