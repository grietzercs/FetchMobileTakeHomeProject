//
//  MockJsonData.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/29/24.
//

import Foundation
@testable import FetchMobileTakeHomeProject

protocol MockJsonData: AnyObject {
    func loadJSON(fileName: String) -> RecipeList
}

extension MockJsonData {
    func loadJSON(fileName: String) -> RecipeList {
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Cannot get provided file url")
        }
        
        do {
            let data = try Data(contentsOf: filePath)
            return try JSONDecoder().decode(RecipeList.self, from: data)
        } catch {
            fatalError("Failed to decode data")
        }
    }
}
