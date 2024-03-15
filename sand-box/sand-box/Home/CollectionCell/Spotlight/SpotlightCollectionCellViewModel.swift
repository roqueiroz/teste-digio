//
//  SpotlightCollectionViewCellViewModel.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import Foundation

class SpotlightCollectionCellViewModel {
 
  private let spotlight: Spotlight
  
  init(_ spotlight: Spotlight) {
    self.spotlight = spotlight
  }
  
  func configure(_ cell: SpotlightCollectionCellView) {
    cell.configCell(spotlight.bannerURL)
  }
}
