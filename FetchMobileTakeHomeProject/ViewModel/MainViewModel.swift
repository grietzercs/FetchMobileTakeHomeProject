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
    @Published var recipeList: RecipeList
    @Published var isListEmpty: Bool = false
    var networkClient: NetworkClientProtocol!
    
    init(networkClient: NetworkClientProtocol) {
        self.recipeList = RecipeList()
        self.networkClient = networkClient
    }
    
    func getList() -> [Recipe] {
        return recipeList.recipes
    }
    
    func refreshList() async {
        recipeList.recipes = []
        await self.getData()
        return
    }
    
    func displayError() {
        self.recipeList.recipes = []
        isListEmpty = true
    }
    
    @MainActor
    func getData() async {
        guard let url = URL(string: Constants.url) else {
            displayError()
            return
        }
        async let recipeList = networkClient.getNetworkAssets(url: url)
        
        do {
            self.recipeList = try await recipeList
        } catch {
            Logger().error("Failed to get recipe list. Error: \(error)")
            displayError()
            return
        }
        
    }
}
