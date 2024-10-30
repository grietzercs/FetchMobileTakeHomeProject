//
//  FetchMobileTests.swift
//  FetchMobileTests
//
//  Created by Colden on 10/29/24.
//

import XCTest
@testable import FetchMobileTakeHomeProject

final class FetchMobileTests: XCTestCase {
    
    var mainViewModel: MainViewModel!

    @MainActor
    override func setUpWithError() throws {
        super.setUp()
        let mockNetworkClient = MockNetworkClient()
        mainViewModel = MainViewModel(networkClient: mockNetworkClient)
    }

    override func tearDownWithError() throws {
        super.tearDown()
        mainViewModel = nil
    }
    
    @MainActor
    func testRecipeListFetchSuccessfully() async {
        await mainViewModel.getData()
        let recipeList = mainViewModel.recipeList.recipes
        
        XCTAssertNotNil(recipeList)
    }
}
