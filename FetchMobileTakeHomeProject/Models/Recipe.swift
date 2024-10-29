//
//  Recipe.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/29/24.
//

import Foundation

struct Recipe: Codable, Hashable {
    var UUID: UUID?
    var cuisine: String?
    var name: String
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
    
    init(UUID: UUID?, cuisine: String?, name: String, photoLarge: URL?, photoSmall: URL?, sourceURL: URL?, ytURL: URL?) {
        self.UUID = UUID
        self.cuisine = cuisine
        self.name = name
        self.photoLarge = photoLarge
        self.photoSmall = photoSmall
        self.sourceURL = sourceURL
        self.ytURL = ytURL
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
