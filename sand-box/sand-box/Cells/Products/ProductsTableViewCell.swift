//
//  ProductsTableViewCell.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var bannerCollectionView: UICollectionView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    bannerCollectionView.dataSource = self
    bannerCollectionView.delegate = self
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return productsDataStore.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductsCollectionViewCell
    cell.bannerImageView.downloaded(from: productsDataStore[indexPath.row].imageURL, contentMode: .scaleToFill)
    cell.bannerImageView.applyshadowWithCorner(containerView: cell.shadowView, cornerRadious: 12)
    return cell
  }
}
