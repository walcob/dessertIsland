//
//  RecipeThumbnail.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeImage: View {
    var imageUrl:String
    var width:CGFloat = 50
    var height:CGFloat = 50
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)){ image in
            image.resizable()
        } placeholder: {
            Color.white
        }
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
        }
}

#Preview {
    RecipeImage(imageUrl: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg")
}
