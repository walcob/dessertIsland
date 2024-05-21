//
//  RecipeListEntry.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

struct RecipeList: Codable
{
    var meals: [RecipeListEntry]
}

struct RecipeListEntry: Codable
{
    var idMeal: String
    var strMeal:String
    var strMealThumb: String
}

