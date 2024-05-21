//
//  RecipeThumbnail.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeThumbnail: View {
    var imageUrl:String
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)){ image in
            image.resizable()
        } placeholder: {
            Color.white
        }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
        }
}

#Preview {
    RecipeThumbnail(imageUrl: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg")
}
