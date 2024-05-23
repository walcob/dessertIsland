//
//  IngredientsView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/23/24.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients: [Ingredient]
    var body: some View {
        Text("Ingredients")
            .font(.title2)
        
        ForEach(ingredients, id:\.ingredient){ ingredient in
            Text("\(ingredient.quantity) \(ingredient.ingredient)")
        }
        .font(.body)
        .frame(maxWidth:.infinity, alignment:.leading)
        .padding([.horizontal])
    }
}

#Preview {
    let sugarPie = TestData().sugarPie()
    return IngredientsView(ingredients:sugarPie.ingredients)
}
