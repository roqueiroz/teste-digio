//
//  SpotlightTableViewCell.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

class SpotlightTableViewCell: UITableViewCell {
  
  @IBOutlet weak var bannersCollectionView: UICollectionView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    bannersCollectionView.dataSource = self
    bannersCollectionView.delegate = self
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  
}

extension SpotlightTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return spotLightDataStore.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SpotlightCollectionViewCell
    cell.bannerImageView.downloaded(from: spotLightDataStore[indexPath.row].bannerURL)
    cell.bannerImageView.applyshadowWithCorner(containerView: cell.shadowView, cornerRadious: 12)
    return cell
  }  
}
