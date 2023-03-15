//
//  RecipePresenterTest.swift
//  PresentationTests
//
//  Created by Clever Capa on 22-08-22.
//
@testable import Presentation
@testable import Domain
@testable import Data
import XCTest

class RecipePresenterTest: XCTestCase {

    var presenter: RecipePresenter!
    
    override func setUp() {
        super.setUp()
        let repository = RecipeRemoteRepository()
        let router = RecipeRouter()
        presenter = RecipePresenter(
            interactor: RecipeInteractor(repository: repository),
            view: nil,
            router: router
        )
    }

    func testFilter() throws {
        let filtered = presenter.filter(text: "Ceviche", recipes: recipes)
        XCTAssertTrue(filtered.count == 3)
    }
    
    func testFilterEmpty() throws {
        let filtered = presenter.filter(text: "Ceviche 04", recipes: recipes)
        XCTAssertTrue(filtered.isEmpty)
    }
    
    func testFilterExactly() throws {
        let filtered = presenter.filter(text: "Ceviche", recipes: recipes)
        XCTAssertTrue(filtered[.zero].nombre == "Ceviche")
    }

    private let recipes: [Recipe] = [
        Recipe(id: 001, nombre: "Ceviche"),
        Recipe(id: 002, nombre: "Combinado"),
        Recipe(id: 003, nombre: "Ceviche 02"),
        Recipe(id: 004, nombre: "Ceviche 01")
    ]

}
