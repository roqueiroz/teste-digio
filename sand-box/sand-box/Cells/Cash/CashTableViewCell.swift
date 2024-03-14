//
//  CashTableViewCell.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

class CashTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bannerImageView: UIImageView!
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}

extension CashTableViewCell {
  func setTitle(_ title: String) {
    let att1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22),
                  NSAttributedString.Key.foregroundColor : UIColor(named: "main")]
    
    let att2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22),
                  NSAttributedString.Key.foregroundColor : UIColor(named: "secondary")]
    
    let split = title.components(separatedBy: " ")
    
    let attributedString1 = NSMutableAttributedString(string: split[0], attributes: att1 as [NSAttributedString.Key : Any])
    let space = NSMutableAttributedString(string: " ", attributes: att1 as [NSAttributedString.Key : Any])
    let attributedString2 = NSMutableAttributedString(string: split[1], attributes: att2 as [NSAttributedString.Key : Any])
    
    attributedString1.append(space)
    attributedString1.append(attributedString2)
    self.titleLabel.attributedText = attributedString1
  }
}
