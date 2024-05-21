//
//  GetRecipe.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

func GetRecipe(recipeListEntry:RecipeListEntry) async throws -> Recipe {
        let apiCommandURL = URL(string:"https://themealdb.com/api/json/v1/1/lookup.php?i=\(recipeListEntry.idMeal)")
        let (data, _) = try await URLSession.shared.data(from: apiCommandURL!)
        let recipes = try JSONDecoder().decode(Recipes.self, from: data)
        return recipes.meals[0]
    
}
