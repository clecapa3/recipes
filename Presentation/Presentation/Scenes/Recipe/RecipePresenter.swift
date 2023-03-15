//
//  RecipePresenter.swift
//  Presentation
//
//  Created by Clever Capa on 12-07-22.
//

import UIKit
import Data
import Domain
 
class RecipePresenter: RecipePresenterPortocol {

    weak var view: RecipeViewProtocol?
    var interactor: RecipeInteractorProtocol?
    var router: RecipeRouterProtocol?
    
    public init(interactor: RecipeInteractorProtocol?, view: RecipeViewProtocol?, router: RecipeRouterProtocol?) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func fetchRecipe() {
        interactor?.fetchRecipe { [weak self] response in
            if let response = response {
                self?.view?.showRecipes(recipes: response.recipes)
            }
        }
    }
    
    func filter(text: String, recipes: [Recipe]) -> [Recipe] {
        let filteredRecipe = recipes.filter({
            $0.nombre.capitalized.contains(text.capitalized)
        })
        return filteredRecipe
    }
    
    func goToDetailView(recipe: Recipe) {
        router?.goToDetailView(recipe: recipe)
    }
}
