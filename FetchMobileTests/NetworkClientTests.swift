//
//  NetworkClientTests.swift
//  FetchMobileTests
//
//  Created by Colden on 10/29/24.
//

import XCTest
@testable import FetchMobileTakeHomeProject

final class NetworkClientTests: XCTestCase {
    
    var networkClient: NetworkClient!

    override func setUpWithError() throws {
        networkClient = NetworkClient()
    }

    override func tearDownWithError() throws {
        networkClient = nil
    }

    func testErrorOnBadData() async throws {
        var thrownError: Error?
        var recipeList: RecipeList?
        do {
            recipeList = try await networkClient.getNetworkAssets(url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!)
        } catch {
            thrownError = error
        }
        XCTAssertNil(thrownError)
        XCTAssertNil(recipeList)
    }
    
    func testErrorOnGoodData() async throws {
        var thrownError: Error?
        var recipeList: RecipeList?
        do {
            recipeList = try await networkClient.getNetworkAssets(url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!)
        } catch {
            thrownError = error
        }
        XCTAssertNotNil(thrownError)
        XCTAssertNotNil(recipeList)
    }
    
    func testErrorOnNoData() async throws {
        var thrownError: Error?
        var recipeList: RecipeList?
        do {
            recipeList = try await networkClient.getNetworkAssets(url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!)
        } catch {
            thrownError = error
        }
        XCTAssertNil(thrownError)
        XCTAssertNil(recipeList)
    }
}
