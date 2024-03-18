//
//  ApiManagerTests.swift
//  sand-boxTests
//
//  Created by Rodrigo Queiroz on 18/03/24.
//

import XCTest

final class ApiManagerTests: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    APIManager.shared.url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") ??  URL(filePath: "")
  }
  
  func testFetchData_withSuccess() {
    //given
    let expectation = XCTestExpectation(description: "Data fetched")
    let sut = APIManager.shared
    var product: ProductData?
    
    //when
    sut.fetchData { result in
      switch result {
        case .success(let products):
          expectation.fulfill()
          product = products
        case .failure(let failure):
          expectation.fulfill()
          XCTFail("It should have fetched correctly, instead error \(failure) ocurred")
      }
    }
    
    //then
    wait(for: [expectation], timeout: 5.0)
    //XCTAssertNotNil(product, "should be filled on the fetch data")
    XCTAssertTrue(product != nil)
    XCTAssertNotNil(product?.products)
    XCTAssertNotNil(product?.spotlights)
  }
  
  func testFetchData_withFailure() {
    //given
    let expectation = XCTestExpectation(description: "Data not fetched")
    APIManager.shared.url = URL(string: "") ?? URL(filePath: "")
    let sut = APIManager.shared
    var product: ProductData?
    
    //when
    sut.fetchData { result in
      switch result {
        case .success(let products):
          expectation.fulfill()
          product = products
          XCTFail("It should have fetched correctly, instead error ocurred")
        case .failure(_):
          expectation.fulfill()
      }
    }
    
    //then
    wait(for: [expectation], timeout: 5.0)
    XCTAssertNil(product)
  }
}
