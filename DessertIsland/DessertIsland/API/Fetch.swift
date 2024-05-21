//  Fetch and decode data from a given API and output type
//  Fetch.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/21/24.
//

import Foundation

func Fetch<T: Decodable>(urlString:String) async throws -> T {
    let fetchUrl = URL(string:urlString)
    let (data, _) = try await URLSession.shared.data(from: fetchUrl!)
    let output: T = try JSONDecoder().decode(T.self, from: data)
    return output
}
