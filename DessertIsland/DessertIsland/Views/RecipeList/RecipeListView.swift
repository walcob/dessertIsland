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

    var filteredRecipes: [RecipeListEntry] {
        recipeList.recipes.filter { recipe in
            search.isEmpty || recipe.name.lowercased().contains(search.lowercased())
        }
    }

    var body: some View {
        NavigationSplitView {
            List(filteredRecipes) { recipeEntry in
                NavigationLink {
                    RecipeView(recipeID: recipeEntry.id)
                } label: {
                    RecipeListRowView(recipeListEntry: recipeEntry)
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
    let recipeListData = RecipeListData()
    recipeListData.recipes = TestData().recipeList.meals
    return RecipeListView()
        .environment(recipeListData)
}
