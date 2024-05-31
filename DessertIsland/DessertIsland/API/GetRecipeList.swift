//
//  GetRecipeList.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

private var dessertsUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

func GetRecipeList() async -> [String: Recipe] {
    do {
        var recipeDictionary = [String: Recipe]()
        let recipeList: RecipeList = try await Fetch(urlString: dessertsUrl)
        for recipe in recipeList.meals {
            recipeDictionary[recipe.id] = recipe
        }
        return recipeDictionary
    } catch {
        fatalError("Failed to load available recipes:\n\(error)")
    }
}
