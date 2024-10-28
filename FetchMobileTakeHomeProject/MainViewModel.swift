//
//  MainViewModel.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/25/24.
//

import SwiftData
import Foundation
import SwiftSoup
import os
import SwiftUICore

@MainActor
class MainViewModel: NSObject, ObservableObject {
    struct Recipe: Codable, Hashable {
        var UUID: UUID?
        var cuisine: String?
        var name: String?
        var photoLarge: URL?
        var photoSmall: URL?
        var sourceURL: URL?
        var ytURL: URL?
        
        private enum CodingKeys: String, CodingKey {
            case name = "name"
            case cuisine = "cuisine"
            case photoLarge = "photo_url_large"
            case photoSmall = "photo_url_small"
            case sourceURL = "source_url"
            case UUID = "uuid"
            case ytURL = "youtube_url"
        }
    }
    
    struct RecipeList: Codable, Hashable {
        var recipes: [Recipe]
        
        init(recipeList: [Recipe]) {
            self.recipes = recipeList
        }
        
        init() {
            self.recipes = []
        }
        
        private enum CodingKeys: String, CodingKey {
            case recipes = "recipes"
        }
    }
    
    var recipeList: RecipeList
    
    override init() {
        recipeList = RecipeList()
    }
    
    func getList() -> [Recipe] {
        return recipeList.recipes
    }
    
    func getNetworkAssets() async -> Data {
        let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        var data: Data = Data()
        do {
            (data, _) = try await URLSession.shared.data(from: url!)
        } catch {
            Logger().error("Failed to complete URLSession")
        }
        return data
    }
    
    func getData() async throws {
        async let data = getNetworkAssets()
        var recipeList: RecipeList = RecipeList()
        do {
            recipeList = try decodeData(data: await data)
        } catch {
            Logger().error("Failed to decode JSON data from network source")
        }
        self.recipeList = recipeList
    }
    
    func decodeData(data: Data) throws -> RecipeList {
        return try JSONDecoder().decode(RecipeList.self, from: data)
    }

}
