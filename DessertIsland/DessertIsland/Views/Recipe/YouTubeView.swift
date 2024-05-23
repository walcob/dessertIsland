//
//  YouTubeView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/23/24.
//

import SwiftUI
import YouTubePlayerKit

struct YouTubeView: View {
    var youTubeURL: String
    
    var body: some View {
        let youTubePlayer = YouTubePlayer(stringLiteral: youTubeURL)
        
        return YouTubePlayerView(youTubePlayer) { state in
                // Overlay ViewBuilder closure to place an overlay View
                // for the current `YouTubePlayer.State`
            switch state {
                case .idle:
                    ProgressView()
                case .ready:
                    EmptyView()
                case .error(_):
                    EmptyView()
            }
        }
        .frame(height:300)
    }
}

#Preview {
    YouTubeView(youTubeURL: "https://youtu.be/dQw4w9WgXcQ?si=SpCWa4FDgM3UKzUr")
}
