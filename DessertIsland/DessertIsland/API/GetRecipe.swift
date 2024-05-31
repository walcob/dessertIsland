//
//  GetRecipe.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

private var lookupBaseUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i="

func GetRecipe(recipeID: String) async -> Recipe {
    let apiCommandURL = "\(lookupBaseUrl)\(recipeID)"
    do {
        let recipes: Recipes = try await Fetch(urlString: apiCommandURL)
        var recipe = recipes.meals[0]
        recipe.isFullyLoaded = true
        return recipe
    } catch {
        fatalError("Failed to load recipe ID \(recipeID)\n\(error)")
    }
}
