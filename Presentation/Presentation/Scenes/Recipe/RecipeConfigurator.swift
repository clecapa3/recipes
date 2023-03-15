//
//  RecipeConfigurator.swift
//  Presentation
//
//  Created by Clever Capa on 12-07-22.
//

import Data
import Domain
import Network

public class RecipeConfigurator {
    
    static func configure(_ view: RecipeViewProtocol) {
        let router = RecipeRouter()
        let repository: RecipeRepositoryProtocol = RecipeRemoteRepository()
        let interactor = RecipeInteractor(repository: repository)
        let presenter =  RecipePresenter(interactor: interactor, view: view, router: router)
        router.view = view
        view.presenter = presenter
    }
}

