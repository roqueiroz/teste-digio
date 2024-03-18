//
//  HomeViewModelTests.swift
//  sand-boxTests
//
//  Created by Rodrigo Queiroz on 18/03/24.
//

import XCTest

final class HomeViewModelTests: XCTestCase {
  
  var sut: HomeViewModel!
  
  override func setUp() {
    super.setUp()
    sut = HomeViewModel()
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
    APIManager.shared.url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") ??  URL(filePath: "")
  }
  
  func testFetchProducts_WithSuccess() {
    //given
    let expectation = XCTestExpectation(description: "Data fetched successfully")
    
    //when
    sut.fetchProducts { result in
      switch result {
        case .success():
          expectation.fulfill()
        case .failure(let failure):
          expectation.fulfill()
          XCTFail("\(failure)")
      }
    }
    
    //then
    wait(for: [expectation], timeout: 5.0)
    XCTAssertNotNil(sut.cash)
    XCTAssertNotNil(sut.productsCollectionDataSource.models)
    XCTAssertNotNil(sut.spotlightCollectionDataSource.models)
    
  }
  
  func testFetchProducts_WithFailure() {
    //given
    let expectation = XCTestExpectation(description: "Data not fetched successfully")
    APIManager.shared.url = URL(string: "") ?? URL(filePath: "")
    
    //when
    sut.fetchProducts { result in
      switch result {
        case .success():
          XCTFail("Should not have been a success")
        case .failure(_):
          expectation.fulfill()
      }
    }
    
    //then
    wait(for: [expectation], timeout: 5.0)
    XCTAssertNil(sut.cash)
    XCTAssertEqual(sut.productsCollectionDataSource.models.isEmpty, true)
    XCTAssertEqual(sut.spotlightCollectionDataSource.models.isEmpty, true)
  }
}
