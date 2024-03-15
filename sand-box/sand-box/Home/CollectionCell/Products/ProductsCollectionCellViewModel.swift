//
//  ProductsCollectionCellViewModel.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import Foundation

class ProductsCollectionCellViewModel {
  private let product: Product
  
  init(product: Product) {
    self.product = product
  }
  
  func configure(_ cell: ProductsCollectionCellView) {
    cell.configCell(product.imageURL)
  }
}
