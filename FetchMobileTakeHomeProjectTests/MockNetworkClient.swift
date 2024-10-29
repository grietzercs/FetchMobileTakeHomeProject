//
//  MockNetworkClient.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/29/24.
//

import Foundation
@testable import FetchMobileTakeHomeProject

final class MockNetworkClient: NetworkClientProtocol, MockJsonData {
    func getNetworkAssets(url: URL) async throws -> RecipeList {
        return loadJSON(fileName: "CleanJsonData.json")
    }
}
