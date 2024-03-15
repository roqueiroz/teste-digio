//
//  ApiManager.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import Foundation

enum DataError: Error {
  case invalidData
  case invalidResponse
  case message(_ error: Error?)
}

class APIManager {
  static let shared = APIManager()
  private init() { }
  
  let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")
  
  func fetchData(completion: @escaping (Result<ProductData, Error>) -> Void) {
    URLSession.shared.dataTask(with: url!) { data, response, error in
      guard let data else {
        completion(.failure(DataError.invalidData))
        return
      }
      guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
        completion(.failure(DataError.invalidResponse))
        return
      }
      
      do {
        let products = try JSONDecoder().decode(ProductData.self, from: data)
        completion(.success(products))
      }
      catch {
        completion(.failure(DataError.message(error)))
      }
    }.resume()
  }
}

struct ProductData: Codable {
  let spotlights: [Spotlight]
  let cash: Cash
  let products: [Product]
  
  enum CodingKeys: String, CodingKey {
    case spotlights = "spotlight"
    case products = "products"
    case cash = "cash"
  }
}

struct Spotlight: Codable {
  let name: String
  let bannerURL: String
  let description: String
}

struct Cash: Codable {
  let title: String
  let bannerURL: String
  let description: String
}

struct Product: Codable {
  let name: String
  let imageURL: String
  let description: String
}
