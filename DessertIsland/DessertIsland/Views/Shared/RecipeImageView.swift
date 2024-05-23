//
//  RecipeImageView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import SwiftUI

struct RecipeImageView: View {
    var imageURL: String
    var width: CGFloat = 50
    var height: CGFloat = 50
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
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
    RecipeImageView(imageURL: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg")
}
