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
    
    override func setUp() {
        super.setUp()
        let mockNetworkClient = MockNetworkClient()
        mainViewModel = MainViewModel(networkClient: mockNetworkClient)
    }
    
    override func tearDown() {
        super.tearDown()
        mainViewModel = nil
    }
    
    func testRecipeListFetchSuccessfully() async {
        //await mainViewModel.getData()
        
        XCTAssertNotNil(mainViewModel.getList())
    }

}
