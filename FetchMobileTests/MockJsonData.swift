//
//  MockJsonData.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/29/24.
//

import Foundation
@testable import FetchMobileTakeHomeProject
import os

protocol MockJsonData: AnyObject {
    var bundle: Bundle { get }
    func loadJSON(fileName: String) -> RecipeList
}

extension MockJsonData {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON(fileName: String) -> RecipeList {
        guard let filePath = bundle.url(forResource: fileName, withExtension: "json") else {
            fatalError("Cannot get provided file url")
        }
        
        guard let data = try? Data(contentsOf: filePath) else {
            fatalError("Failed to get data from URL: \(filePath)")
        }
        
        do {
            return try JSONDecoder().decode(RecipeList.self, from: data)
        } catch {
            fatalError("Failed to decode data")
        }
    }
}
