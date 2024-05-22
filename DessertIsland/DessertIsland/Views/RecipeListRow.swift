//
//  RecipeListRow.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeListRow: View {
    var recipeListEntry: RecipeListEntry
    
    var body: some View {
        HStack{
            RecipeImage(imageUrl:recipeListEntry.strMealThumb)
            Text(recipeListEntry.strMeal)
            Spacer()
        }
    }
}

#Preview {
    let recipeList = TestData().recipeList
    let sugarPieEntry = recipeList.meals.first(where: {$0.idMeal == sugarPieID})
    return RecipeListRow(recipeListEntry: sugarPieEntry!)
}
