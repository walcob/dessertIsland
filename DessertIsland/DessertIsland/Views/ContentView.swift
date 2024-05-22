//
//  ContentView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var recipeList:[RecipeListEntry] = []
    
    var body: some View {
        RecipeListView(recipeList:recipeList)
            .task{
                recipeList = await GetRecipeList()
            }
    }
}

#Preview {
    ContentView()
}
