//
//  SpotlightMock.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import Foundation

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

