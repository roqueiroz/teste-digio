//
//  DetailViewModelTests.swift
//  sand-boxTests
//
//  Created by Rodrigo Queiroz on 18/03/24.
//

import XCTest

final class DetailViewModelTests: XCTestCase {
  var sut: DetailViewModel?
  
  func testCashModel_withSucess() {
    let mockData = MockProductData().createMockSuccess()
    let detailModel = DetailModel(
      title: mockData.cash.title,
      bannerURL: mockData.cash.bannerURL,
      description: mockData.cash.description
    )
    sut = DetailViewModel(detailModel: detailModel)
    XCTAssertNotNil(sut?.detailModel.bannerURL)
    XCTAssertNotNil(sut?.detailModel.description)
    XCTAssertNotNil(sut?.detailModel.title)
  }
  
  func testCashModel_empty() {
    let mockData = MockProductData().createMockEmpty()
    let detailModel = DetailModel(
      title: mockData.cash.title,
      bannerURL: mockData.cash.bannerURL,
      description: mockData.cash.description
    )
    sut = DetailViewModel(detailModel: detailModel)
    XCTAssertEqual(sut?.detailModel.bannerURL, "")
    XCTAssertEqual(sut?.detailModel.description, "")
    XCTAssertEqual(sut?.detailModel.title, "")
  }
  
  func testProductModel_withSucess() {
    let mockData = MockProductData().createMockSuccess()
    let detailModel = DetailModel(
      title: mockData.products[0].name,
      bannerURL: mockData.products[0].imageURL,
      description: mockData.products[0].description
    )
    sut = DetailViewModel(detailModel: detailModel)
    XCTAssertNotNil(sut?.detailModel.bannerURL)
    XCTAssertNotNil(sut?.detailModel.description)
    XCTAssertNotNil(sut?.detailModel.title)
  }
  
  func testProductModel_empty() {
    let mockData = MockProductData().createMockEmpty()
    let detailModel = DetailModel(
      title: mockData.products[0].name,
      bannerURL: mockData.products[0].imageURL,
      description: mockData.products[0].description
    )
    sut = DetailViewModel(detailModel: detailModel)
    XCTAssertEqual(sut?.detailModel.bannerURL, "")
    XCTAssertEqual(sut?.detailModel.description, "")
    XCTAssertEqual(sut?.detailModel.title, "")
  }
  
  func testSpotlightModel_withSucess() {
    let mockData = MockProductData().createMockSuccess()
    let detailModel = DetailModel(
      title: mockData.spotlights[0].name,
      bannerURL: mockData.spotlights[0].bannerURL,
      description: mockData.spotlights[0].description
    )
    sut = DetailViewModel(detailModel: detailModel)
    XCTAssertNotNil(sut?.detailModel.bannerURL)
    XCTAssertNotNil(sut?.detailModel.description)
    XCTAssertNotNil(sut?.detailModel.title)
  }
  
  func testSpotlightModel_empty() {
    let mockData = MockProductData().createMockEmpty()
    let detailModel = DetailModel(
      title: mockData.spotlights[0].name,
      bannerURL: mockData.spotlights[0].bannerURL,
      description: mockData.spotlights[0].description
    )
    sut = DetailViewModel(detailModel: detailModel)
    XCTAssertEqual(sut?.detailModel.bannerURL, "")
    XCTAssertEqual(sut?.detailModel.description, "")
    XCTAssertEqual(sut?.detailModel.title, "")
  }
}
