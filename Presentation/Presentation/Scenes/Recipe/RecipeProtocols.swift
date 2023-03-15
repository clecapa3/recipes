//
//  RecipeProtocols.swift
//  Presentation
//
//  Created by Clever Capa on 22-08-22.
//

import Foundation
import Data
import Domain

protocol RecipeViewProtocol: AnyObject {
    var presenter: RecipePresenterPortocol? { get set }
    func showRecipes(recipes: [Recipe])
}

protocol RecipePresenterPortocol {
    var view: RecipeViewProtocol? { get set }
    var interactor: RecipeInteractorProtocol? { get set }
    var router: RecipeRouterProtocol? { get set }
    func fetchRecipe()
    func filter(text: String, recipes: [Recipe]) -> [Recipe]
    func goToDetailView(recipe: Recipe)
}

protocol RecipeRouterProtocol {
    var view: RecipeViewProtocol? { get set }
    func goToDetailView(recipe: Recipe?)
    func goToMap(recipe: Recipe?)
}
