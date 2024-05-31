//
//  RecipeListData.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/22/24.
//

import Foundation

@Observable
class RecipeListData {
    var recipes = Dictionary<String,Recipe>()
    
    init(recipeList:RecipeList)
    {
        recipeList.meals.forEach{ recipe in
            recipes[recipe.id] = recipe
        }
    }
    init()
    {
    }
}
