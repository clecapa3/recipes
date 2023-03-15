//
//  RecipeRouter.swift
//  Presentation
//
//  Created by Clever Capa on 12-07-22.
//

import UIKit
import Data
 
class RecipeRouter: RecipeRouterProtocol {
    
    var view: RecipeViewProtocol?
    
    func goToDetailView(recipe: Recipe?) {
        if let view = view as? UIViewController {
            let viewController = DetailRecipeViewController()
            viewController.recipe = recipe
            viewController.router = self
            view.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func goToMap(recipe: Recipe?) {
        if let view = view as? UIViewController {
            let viewController = MapRecipeViewController()
            viewController.recipe = recipe
            view.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
