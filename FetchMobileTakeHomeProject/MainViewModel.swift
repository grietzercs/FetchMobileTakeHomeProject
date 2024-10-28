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

@MainActor
class MainViewModel: NSObject, ObservableObject {
    struct Recipe: Codable, Hashable {
        var UUID: UUID
        var type: String
        var name: String
        var photoLarge: URL
        var photoSmall: URL
        var sourceURL: URL
        var ytURL: URL
        
        init(UUID: UUID, type: String, name: String, photoLarge: URL, photoSmall: URL, sourceURL: URL, ytURL: URL) {
            self.UUID = UUID
            self.type = type
            self.name = name
            self.photoLarge = photoLarge
            self.photoSmall = photoSmall
            self.sourceURL = sourceURL
            self.ytURL = ytURL
        }
    }
    
    var recipeList: [Recipe]
    
    override init() {
        recipeList = []
    }
    
    func retrieveData(/*inputURL: String*/) async throws /*-> [Recipe]*/ {
        let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        var data: Data = Data()
        do {
            (data, _) = try await URLSession.shared.data(from: url!)
        } catch {
            Logger().error("Failed to complete URLSession")
        }
        let decoder = JSONDecoder()
        var recipeList: [Recipe] = []
        do {
            recipeList = try decoder.decode([Recipe].self, from: data)
        } catch {
            Logger().error("Failed to decode URLSession data")
        }
        self.recipeList = recipeList
    }
    
//    func getRecipeList() {
//        let url: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
//        //retrieveData(inputURL: url)
//    }
}
