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
        List(recipeList, id: \.idMeal) { recipeEntry in
            RecipeListRow(recipeListEntry: recipeEntry)
        }
    }
}

#Preview {
    let recipeList = TestData().recipeList
    return RecipeListView(recipeList: recipeList.meals)
}
