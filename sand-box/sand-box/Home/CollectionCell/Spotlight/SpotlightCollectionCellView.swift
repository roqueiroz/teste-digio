//
//  BannerCollectionViewCell.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import UIKit

final class SpotlightCollectionCellView: BaseCollectionViewCell {
  static let identifier: String = "SpotlightCollectionCellView"
  
  private let bannerImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  override func initialize() {
    contentView.addSubview(bannerImageView,
                           enableConstraints: true)
    contentView.layer.shadowRadius = 5
    contentView.layer.shadowOffset = .zero
  }
  
  override func installConstraints() {
    NSLayoutConstraint.activate([
      bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 4),
    ])
  }
}

extension SpotlightCollectionCellView {
  func configCell(_ path: String) {
    bannerImageView.applyshadowWithCorner(containerView: self, cornerRadious: 12)
    bannerImageView.downloaded(from: path)
  }
}
