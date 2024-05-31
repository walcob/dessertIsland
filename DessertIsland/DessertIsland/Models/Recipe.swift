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

struct Recipe: Codable, Identifiable, Comparable {
    static func < (lhs: Recipe, rhs: Recipe) -> Bool {
        // This allows us to sort recipes alphabetically
        return lhs.name < rhs.name
    }

    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        // each recipe is uniquely identified by its ID, so we
        // should consider two recipes to be the same if they share IDs
        return lhs.id == rhs.id
    }

    var id: String
    var name: String
    var category: String = ""
    var area: String = ""
    var instructions: String = ""
    var thumbnailURL: String
    var youtubeURL: String = ""
    var ingredients: [Ingredient] = []
    var source: String = ""
    var isFullyLoaded: Bool = false

    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int?
        init?(intValue _: Int) {
            return nil
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        // Required pieces
        id = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "idMeal")!)
        name = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMeal")!)
        thumbnailURL = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMealThumb")!)

        ingredients = try decodeIngredients(container: container)

        category = decodeString(container: container, stringValue: "strCategory")
        area = decodeString(container: container, stringValue: "strArea")
        instructions = decodeString(container: container, stringValue: "strInstructions")
        youtubeURL = decodeString(container: container, stringValue: "strYoutube")
        source = decodeString(container: container, stringValue: "strSource")
    }

    private func decodeIngredients(container: KeyedDecodingContainer<DynamicCodingKeys>) throws -> [Ingredient] {
        var ingredients: [Ingredient] = []
        for key in container.allKeys {
            if key.stringValue.starts(with: "strIngredient") {
                let ingredient = try container.decode(String?.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
                if let ingredient, !ingredient.isEmpty {
                    let quantityKey = "strMeasure\(key.stringValue.split(separator: "strIngredient")[0])"
                    let quantity = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: quantityKey)!)
                    ingredients.append(Ingredient(quantity: quantity, ingredient: ingredient))
                }
            }
        }
        return ingredients
    }

    private func decodeString(container: KeyedDecodingContainer<DynamicCodingKeys>, stringValue: String) -> String {
        do {
            let decodedString = try container.decode(String?.self, forKey: DynamicCodingKeys(stringValue: stringValue)!)
            return decodedString ?? ""
        } catch {
            return ""
        }
    }
}

struct Ingredient: Codable {
    var quantity: String
    var ingredient: String
}
