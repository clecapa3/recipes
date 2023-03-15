//
//  DetailRecipeViewController.swift
//  Presentation
//
//  Created by Clever Capa on 12-07-22.
//

import UIKit
import Domain
import Data

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var showMapButton: UIButton!
    
    var recipe: Recipe?
    var router: RecipeRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalle"
        titleLabel.text = recipe?.nombre
        descriptionLabel.text = recipe?.preparacion
        showMapButton.layer.cornerRadius = showMapButton.frame.height / 2
        guard let ingredientes = recipe?.ingredientes else { return }
        var ingredientesString = ""
        for item in ingredientes {
            ingredientesString += "\(item) \n"
        }
        ingredientsLabel.text = ingredientesString
    }

    @IBAction func showMapButtonPressed(_ sender: Any) {
        router?.goToMap(recipe: recipe)
    }
}
