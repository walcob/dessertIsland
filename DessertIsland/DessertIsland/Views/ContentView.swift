//
//  ContentView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(RecipeListData.self) var recipeList

    var body: some View {
        RecipeListView()
            .task {
                recipeList.recipes = await GetRecipeList()
            }
    }
}

#Preview {
    let recipeListData = RecipeListData()
    recipeListData.recipes = TestData().recipeList.meals
    return ContentView()
        .environment(recipeListData)
}
