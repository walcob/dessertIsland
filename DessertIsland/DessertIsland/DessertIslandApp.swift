//
//  DessertIslandApp.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

@main
struct DessertIslandApp: App {
    @State private var recipeListData: RecipeListData = .init()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    recipeListData.recipes = await GetRecipeList()
                }
                .environment(recipeListData)
        }
    }
}
