//
//  NetworkClient.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/29/24.
//

import Foundation

enum NetworkError: Error {
    case badURL(String = "")
    case failedToGetData(String = "")
}

protocol NetworkClientProtocol {
    func getNetworkAssets(url: URL) async throws -> RecipeList
}

final class NetworkClient: NetworkClientProtocol {
    
    func getNetworkAssets(url: URL) async throws -> RecipeList {
        let (data, _) = try await URLSession.shared.data(from: url)
        // Not using generics here since only using for provided JSON data
        return try JSONDecoder().decode(RecipeList.self, from: data)
    }
}
