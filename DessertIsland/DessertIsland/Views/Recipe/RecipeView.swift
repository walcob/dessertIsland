//
//  RecipeView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeView: View {
    var recipeID: String
    @State private var recipe: Recipe? = nil

    var body: some View {
        if let recipe {
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
                    recipe = await GetRecipe(recipeID: recipeID)
                }
        }
    }
}

#Preview {
    RecipeView(recipeID: sugarPieID)
}
