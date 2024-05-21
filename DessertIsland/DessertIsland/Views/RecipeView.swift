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
        Text("")
            .task {
                recipe = await GetRecipe(recipeID:recipeID)
            }
        if recipe != nil{
            VStack{
                RecipeImage(imageUrl: recipe!.thumbnailURL,width:200,height:200)
                Link(recipe!.name,destination:URL(string:recipe!.source)!)
                    .font(.largeTitle)
                
                Text(recipe!.area)
                .font(.caption)
                    
                List() {
                    Section(header:Text("Ingredients")){
                        ForEach(recipe!.ingredients, id:\.ingredient){ ingredient in
                            Text("\(ingredient.quantity) \(ingredient.ingredient)")
                        }
                    }
                }
                Divider()
                ScrollView{
                    Text(recipe!.instructions)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    RecipeView(recipeID: sugarPieID)
}
