//
//  Extension+UIView.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import UIKit

extension UIView {
  func addSubview(_ subview: UIView, enableConstraints: Bool) {
    addSubview(subview)
    subview.translatesAutoresizingMaskIntoConstraints = !enableConstraints
  }
  
  func addSubviews(_ subviews: [UIView], enableConstraints: Bool) {
    subviews.forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = !enableConstraints
    }
  }
  
  func anchorEqualTo(view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  func anchorEqualToSafeAreaLayoutGuide(view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
  func addShadow(shadowColor: UIColor,
                 shadowOpacity: Float,
                 shadowRadius: Double,
                 position: CGSize = .zero) {
    layer.shadowColor = shadowColor.cgColor
    layer.shadowOpacity = shadowOpacity
    layer.shadowRadius = shadowRadius
    layer.shadowOffset = position
  }
}
