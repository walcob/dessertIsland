//
//  Recipe.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation
import SwiftUI

struct Recipes: Codable {
    var meals: [Recipe]
}

struct Recipe: BaseRecipe {
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var thumbnailURL: String
    var youtubeURL: String
    var ingredients: [Ingredient]
    var source: String
    
    private struct DynamicCodingKeys: CodingKey{
        var stringValue: String
        init?(stringValue: String){
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        init?(intValue: Int){
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:DynamicCodingKeys.self)
        ingredients = []
        
        for key in container.allKeys{
            if key.stringValue.starts(with:"strIngredient")
            {
                let ingredient = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:key.stringValue)!)
                if !ingredient.isEmpty
                {
                    let quantityKey = "strMeasure\(key.stringValue.split(separator:"strIngredient")[0])"
                    let quantity = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:quantityKey)!)
                    ingredients.append(Ingredient(quantity:quantity, ingredient:ingredient))
                }
            }
        }
        id = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:"idMeal")!)
        name = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:"strMeal")!)
        category = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:"strCategory")!)
        area = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:"strArea")!)
        instructions = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:"strInstructions")!)
        thumbnailURL = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:"strMealThumb")!)
        youtubeURL = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:"strYoutube")!)
        source = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue:"strSource")!)
    }
}


struct Ingredient: Codable {
    var quantity: String
    var ingredient: String
    
}
