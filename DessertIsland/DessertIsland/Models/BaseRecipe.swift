//
//  BaseRecipe.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/30/24.
//

import Foundation

protocol BaseRecipe: Codable, Identifiable
{
    var id: String{get set}
    var thumbnailURL: String {get set}
    var name: String {get set}
}
