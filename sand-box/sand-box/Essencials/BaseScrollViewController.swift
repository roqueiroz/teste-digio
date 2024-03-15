//
//  BaseScrollViewController.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

open class BaseScrollViewController<View: BaseScrollView>: UIViewController {
  
  public var baseView: View {
    return view as! View
  }
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  public required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func loadView() {
    view = View()
  }
}
