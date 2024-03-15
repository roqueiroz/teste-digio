//
//  BaseView.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

private protocol BaseViewProtocol {
  func initialize()
  func installConstraints()
  func setup()
}

private extension BaseViewProtocol {
  func setup() {
    initialize()
    installConstraints()
  }
}


open class BaseView: UIView, BaseViewProtocol {
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  public required init() {
    super.init(frame: CGRect.zero)
    setup()
  }

  /// Default implementation does nothing
  open func initialize() { fatalError("Must be overridden") }

  /// Default implementation does nothing
  open func installConstraints() { fatalError("Must be overridden") }
}

// MARK: - BaseScrollView

open class BaseScrollView: UIView, BaseViewProtocol {
  // MARK: - Public Variables
  
  public let scrollView: UIScrollView = {
    $0.showsVerticalScrollIndicator = false
    return $0
  }(UIScrollView())
  public let contentView: UIView = {
    $0.backgroundColor = UIColor.white
    return $0
  }(UIView())
  
  // MARK: - Init
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    setupScrollView()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
    setupScrollView()
  }
  
  public required init() {
    super.init(frame: CGRect.zero)
    setup()
    setupScrollView()
  }
  
  /// Default implementation does nothing
  open func initialize() { fatalError("Must be overridden") }

  /// Default implementation does nothing
  open func installConstraints() { fatalError("Must be overridden") }
}

// MARK: - Private extension

private extension BaseScrollView {
  func setupScrollView() {
    scrollView.addSubview(contentView,
                          enableConstraints: true)
    addSubview(scrollView,
               enableConstraints: true)
    
    installConstraintContentView()
    installConstraintScroll()
  }
  
  func installConstraintContentView() {
    contentView.anchorEqualTo(view: scrollView)
    NSLayoutConstraint.activate([
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).withPriority(UILayoutPriority.defaultLow)
    ])
  }
  
  func installConstraintScroll() {
    scrollView.anchorEqualToSafeAreaLayoutGuide(view: self)
  }
}



// MARK: - BaseCollectionViewCell

open class BaseCollectionViewCell: UICollectionViewCell, BaseViewProtocol {
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  public required init() {
    super.init(frame: CGRect.zero)
    setup()
  }

  /// Default implementation does nothing
  open func initialize() { fatalError("Must be overridden") }

  /// Default implementation does nothing
  open func installConstraints() { fatalError("Must be overridden") }
}

