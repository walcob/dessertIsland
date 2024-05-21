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
    
    
    var body: some View {
        Text("")
            .task {
                do{
                    recipe =
                    try await GetRecipe(recipeID:recipeID)
                } catch{
                    fatalError("Failed to load recipe\n\n\(error)")
                }
            }
        if recipe != nil{
            VStack{
                RecipeImage(imageUrl: recipe!.strMealThumb!,width:200,height:200)
                Text(recipe!.strMeal)
                    .font(.largeTitle)
                
                HStack{
                    VStack{
                        Text("Ingredients")
                            .font(.title2)
                        Text("\(recipe!.strMeasure1!) \(recipe!.strIngredient1!)")
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeView(recipeID: sugarPieID)
}
