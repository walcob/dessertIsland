//
//  RecipeView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeView: View {
    var recipeID: String
    @Environment(RecipeListData.self) var recipeList

    var body: some View {
        if recipeList.recipes[recipeID]!.isFullyLoaded {
            let recipe: Recipe = recipeList.recipes[recipeID]!
            ScrollView {
                RecipeHeaderView(imageURL: recipe.thumbnailURL, name: recipe.name, area: recipe.area, source: recipe.source)

                if !recipe.youtubeURL.isEmpty {
                    YouTubeView(youTubeURL: recipe.youtubeURL)
                }

                Divider()

                IngredientsView(ingredients: recipe.ingredients)

                Divider()

                InstructionsView(instructions: recipe.instructions)
            }
        } else {
            ProgressView()
                .controlSize(.large)
                .task {
                    recipeList.recipes[recipeID] = await GetRecipe(recipeID: recipeID)
                }
        }
    }
}

#Preview {
    let recipeListData: RecipeListData = TestData().recipeListData
    return RecipeView(recipeID: sugarPieID)
        .environment(recipeListData)
}
