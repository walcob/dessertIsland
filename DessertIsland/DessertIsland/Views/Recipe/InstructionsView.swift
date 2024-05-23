//
//  InstructionsView.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/23/24.
//

import SwiftUI

struct InstructionsView: View {
    var instructions: String
    var body: some View {
        Text("Instructions")
            .font(.title2)
        Text(instructions)
            .font(.body)
            .padding([.horizontal])
    }
}

#Preview {
    let sugarPie = TestData().sugarPie()
    return InstructionsView(instructions: sugarPie.instructions)
}
