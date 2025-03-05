//
//  RecipeListView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(RecipeListData.self) var recipeList
    @State private var search = ""

    var filteredRecipes: [Recipe] {
        recipeList.recipes.filter { _, recipe in
            search.isEmpty || recipe.name.lowercased().contains(search.lowercased())
        }.values.sorted()
    }

    var body: some View {
        NavigationSplitView {
            List(filteredRecipes) { recipe in
                NavigationLink {
                    RecipeView(recipeID: recipe.id)
                } label: {
                    RecipeListRowView(recipe: recipe)
                }
            }
            .navigationTitle("Dessert Recipes")
        } detail: {
            Text("Select a recipe")
        }
        .searchable(text: $search, prompt: "Recipe name")
    }
}

#Preview {
    let recipeListData = TestData().recipeListData
    return RecipeListView()
        .environment(recipeListData)
}
