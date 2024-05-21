//
//  GetRecipeList.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

private var dessertsUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

func GetRecipeList() async -> [RecipeListEntry] {
    do {
        let recipeList: RecipeList = try await Fetch(urlString:dessertsUrl)
        return recipeList.meals.sorted{
            return $0.strMeal < $1.strMeal
        }
    } catch
        {
        fatalError("Failed to load available recipes:\n\(error)")
    }
}
