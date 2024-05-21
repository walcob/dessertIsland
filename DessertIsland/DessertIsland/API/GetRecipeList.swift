//
//  GetRecipeList.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation


func GetRecipeList() async throws -> [RecipeListEntry] {
    let apiCommandURL = URL(string:"https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
    let (data, _) = try await URLSession.shared.data(from: apiCommandURL!)
    let recipeList = try? JSONDecoder().decode( RecipeList.self, from: data)
    return recipeList?.meals.sorted{
        return $0.strMeal < $1.strMeal
    } ?? []
}
