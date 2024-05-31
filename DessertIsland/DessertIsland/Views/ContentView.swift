//
//  ContentView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(RecipeListData.self) var recipeList

    var body: some View {
        RecipeListView()
    }
}

#Preview {
    let recipeListData = TestData().recipeListData
    return ContentView()
        .environment(recipeListData)
}
