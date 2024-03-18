//
//  Extension+UIImageView.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

extension UIImageView {
  func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
    contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard
        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil,
        let image = UIImage(data: data)
      else {
        DispatchQueue.main.async() { [weak self] in
          self?.image = UIImage(named: "default-image")
        }
        return
      }
      DispatchQueue.main.async() { [weak self] in
        self?.image = image
      }
    }.resume()
  }
  
  func downloaded(from link: String, contentMode mode: ContentMode = .scaleToFill) {
    guard let url = URL(string: link) else { return }
    downloaded(from: url, contentMode: mode)
  }
  
  func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
    containerView.clipsToBounds = false
    containerView.layer.shadowColor = UIColor.gray.cgColor
    containerView.layer.shadowOpacity = 1
    containerView.layer.shadowOffset = CGSize(width: -2, height: 2)
    self.clipsToBounds = true
    self.layer.cornerRadius = cornerRadious
  }
}
