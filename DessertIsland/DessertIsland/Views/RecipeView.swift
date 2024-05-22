//
//  RecipeView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeView: View {
    var recipeID: String
    @State private var recipe:Recipe? = nil
    @State private var areIngredientsCollapsed = false
    
    
    var body: some View {
        if let recipe{
            VStack{
                RecipeImage(imageUrl: recipe.thumbnailURL,width:200,height:200)
                    Text(recipe.name)
                    .font(.largeTitle)
                HStack{
                    Text(recipe.area)
                    
                    if let sourceUrl = URL(string:recipe.source){
                        Link(sourceUrl.host!,destination:sourceUrl)
                    }
                }
                .font(.caption)
                    
                List() {
                    Section(header:Text("Ingredients")){
                        ForEach(recipe.ingredients, id:\.ingredient){ ingredient in
                            Text("\(ingredient.quantity) \(ingredient.ingredient)")
                        }
                    }
                }
                
                Divider()
                ScrollView{
                    Text(recipe.instructions)
                        .padding()
                }
            }
        } else {
            ProgressView()
                .controlSize(.large)
                .task {
                    recipe = await GetRecipe(recipeID:recipeID)
                }
        }
    }
}

#Preview {
    RecipeView(recipeID: sugarPieID)
}
