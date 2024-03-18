//
//  MockApiManager.swift
//  sand-boxTests
//
//  Created by Rodrigo Queiroz on 18/03/24.
//

import Foundation

class MockApiManager: APIManager {
  override func fetchData(completion: @escaping (Result<ProductData, Error>) -> Void) {
    let mockData = MockProductData().createMockSuccess()
    completion(.success(mockData))
  }
}
