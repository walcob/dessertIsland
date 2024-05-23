//
//  RecipeHeader.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/23/24.
//

import SwiftUI

struct RecipeHeaderView: View {
    var imageURL: String
    var name: String
    var area: String
    var source: String?
    var body: some View {
        RecipeImageView(imageURL: imageURL,width:200,height:200)
        Text(name)
            .font(.largeTitle)
        HStack{
            Text(area)
            
            if let source, let sourceURL = URL(string:source){
                Link(sourceURL.host!,destination:sourceURL)
            }
        }
        .font(.caption)
    }
}

#Preview {
    let sugarPie:Recipe = TestData().sugarPie()
    return RecipeHeaderView(imageURL: sugarPie.thumbnailURL, name: sugarPie.name, area: sugarPie.area, source:sugarPie.source)
}
