//
//  RecipeListRowView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeListRowView: View {
    var recipe: Recipe

    var body: some View {
        HStack {
            RecipeImageView(imageURL: recipe.thumbnailURL)
            Text(recipe.name)
            Spacer()
        }
    }
}

#Preview {
    let recipeListData = TestData().recipeListData
    let sugarPieEntry = recipeListData.recipes[sugarPieID]
    return RecipeListRowView(recipe: sugarPieEntry!)
}
