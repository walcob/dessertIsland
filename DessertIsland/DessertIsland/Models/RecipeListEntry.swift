//
//  RecipeListEntry.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

struct RecipeList: Codable {
    var meals: [RecipeListEntry]
}

struct RecipeListEntry: BaseRecipe {
    var id: String
    var name: String
    var thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
    }
}
