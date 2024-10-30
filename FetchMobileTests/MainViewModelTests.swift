//
//  MainViewModelTests.swift
//  FetchMobileTakeHomeProjectTests
//
//  Created by Colden on 10/29/24.
//

import XCTest
@testable import FetchMobileTakeHomeProject

final class MainViewModelTests: XCTestCase {
    
    var mainViewModel: MainViewModel!
    var mockNetworkClient: MockNetworkClient!
    
    @MainActor
    override func setUp() {
        super.setUp()
        mockNetworkClient = MockNetworkClient()
        mainViewModel = MainViewModel(networkClient: mockNetworkClient)
    }
    
    override func tearDown() {
        super.tearDown()
        mainViewModel = nil
        mockNetworkClient = nil
    }
    
    func testRecipeListFetchSuccessfully() async {
        mockNetworkClient.fileName = "CleanJsonData"
        await mainViewModel.getData()
        await MainActor.run {
            XCTAssertNotNil(mainViewModel.getList())
        }
    }
    
}
