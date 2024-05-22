//
//  RecipeListView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeListView: View {
    var recipeList: [RecipeListEntry]
    
    var body: some View {
        NavigationSplitView{
            List(recipeList, id: \.idMeal) { recipeEntry in
                NavigationLink{
                    RecipeView(recipeID: recipeEntry.idMeal)
                } label: {
                    RecipeListRow(recipeListEntry: recipeEntry)
                }
            }
            .navigationTitle("Dessert Recipes")
        } detail: {
            Text("Select a recipe")
        }
    }
}

#Preview {
    let recipeList = TestData().recipeList
    return RecipeListView(recipeList: recipeList.meals)
}
