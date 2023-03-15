//
//  RecipeViewController.swift
//  Presentation
//
//  Created by Clever Capa on 12-07-22.
//

import UIKit
import Domain
import Data

class RecipesViewController: UIViewController  {
    
    private var recipeListFilter: [Recipe] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var recipeList: [Recipe] = []
    var presenter: RecipePresenterPortocol?
    var router: RecipeRouterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(
            self,
            action: #selector(RecipesViewController.handleRefresh(_:)),
            for: UIControl.Event.valueChanged
        )
        refreshControl.tintColor = UIColor.blue
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        prepareSerch()
        RecipeConfigurator.configure(self)
        fetchRecipe()
    }
    
    private func fetchRecipe() {
        if let presenter = presenter {
            loadingView.startAnimating()
            loadingView.isHidden = false
            presenter.fetchRecipe()
        }
    }
    
    private func prepareTableView() {
        title = RecipeConstans.title
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: RecipeConstans.recipeCellId, bundle: nil), forCellReuseIdentifier: RecipeConstans.recipeCellId)
        tableView.addSubview(self.refreshControl)
    }
    
    private func prepareSerch() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = RecipeConstans.titleSearch
        navigationItem.searchController = search
      }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
        fetchRecipe()
    }
    
}

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeListFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeConstans.recipeCellId, for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        cell.dateLabel.text = "\(recipeListFilter[indexPath.row].nombre)"
        cell.descriptionLabel.text = recipeListFilter[indexPath.row].preparacion
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipeListFilter[indexPath.row]
        presenter?.goToDetailView(recipe: recipe)
    }
    
}

extension RecipesViewController: RecipeViewProtocol {
    func showRecipes(recipes: [Recipe]) {
        loadingView.stopAnimating()
        loadingView.isHidden = true
        recipeList = recipes
        recipeListFilter = recipes
        tableView.reloadData()
    }
}

extension RecipesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.isEmpty {
            recipeListFilter = recipeList
        } else {
            recipeListFilter = presenter?.filter(text: text.capitalized, recipes: recipeList) ?? []
        }
    }
}
