//
//  Extension+NSLayoutConstraint.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import UIKit

public extension NSLayoutConstraint {
  @discardableResult func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
    self.priority = priority
    return self
  }
}
