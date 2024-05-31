//
//  GetRecipeList.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

private var dessertsUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

func GetRecipeList() async -> Dictionary<String,Recipe> {
    do {
        var recipeDictionary = Dictionary<String,Recipe>()
        let recipeList: RecipeList = try await Fetch(urlString: dessertsUrl)
        recipeList.meals.forEach({ recipe in
            recipeDictionary[recipe.id] = recipe
        })
        return recipeDictionary
    } catch {
        fatalError("Failed to load available recipes:\n\(error)")
    }
}
