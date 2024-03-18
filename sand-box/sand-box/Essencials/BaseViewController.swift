//
//  BaseViewController.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import UIKit

open class BaseViewController<View: BaseView>: UIViewController {
  // MARK: - Internal variables
  
  public var baseView: View {
    return view as! View
  }
  
  // MARK: - Initializers
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  public required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Override methods
  
  override public func loadView() {
    view = View()
  }
}

