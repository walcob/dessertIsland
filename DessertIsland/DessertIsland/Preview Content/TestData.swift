//  Local test data to use for previewing and debugging purposes
//
//  TestData.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

@Observable
class TestData {
    var recipeList: RecipeList = load("recipes.json")

    func sugarPie() -> Recipe {
        let recipes: RawRecipes = load("sugarPie.json")
        return ConvertToRecipe(rawRecipe: recipes.meals[0])
    }
}

let sugarPieID = "52931"

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
