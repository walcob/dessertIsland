//
//  RecipeListRowView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeListRowView: View {
    var recipeListEntry: RecipeListEntry

    var body: some View {
        HStack {
            RecipeImageView(imageURL: recipeListEntry.thumbnailURL)
            Text(recipeListEntry.name)
            Spacer()
        }
    }
}

#Preview {
    let recipeList = TestData().recipeList
    let sugarPieEntry = recipeList.meals.first(where: { $0.id == sugarPieID })
    return RecipeListRowView(recipeListEntry: sugarPieEntry!)
}
