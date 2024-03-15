//
//  ProductsCollectionCellView.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import UIKit

final class ProductsCollectionCellView: BaseCollectionViewCell {
  static let identifier: String = "ProductsCollectionCellView"
  
  private let productImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  override func initialize() {
    contentView.addSubview(productImageView,
                           enableConstraints: true)
    contentView.layer.shadowRadius = 5
    contentView.layer.shadowOffset = .zero
  }
  
  override func installConstraints() {
    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 4),
    ])
  }
}

extension ProductsCollectionCellView {
  func configCell(_ path: String) {
    productImageView.applyshadowWithCorner(containerView: self, cornerRadious: 12)
    productImageView.downloaded(from: path)
  }
}
