//
//  RecipeListData.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/22/24.
//

import Foundation

@Observable
class RecipeListData {
    var recipes = [String: Recipe]()

    init(recipeList: RecipeList) {
        for recipe in recipeList.meals {
            recipes[recipe.id] = recipe
        }
    }

    init() {}
}
