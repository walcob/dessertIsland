//
//  Recipe.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable, Codable {
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var thumbnailURL: String
    var youtubeUrl: String
    var ingredients: [Ingredient]
    var source: String
}

struct Ingredient: Codable {
    var quantity: String
    var ingredient: String
}
