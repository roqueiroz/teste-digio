//
//  HomeView.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

final class HomeView: BaseScrollView {
  
  private let containerView = UIView()
  private let headerView = UIView()
  private let viewLoader: UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = .white
    view.isHidden = true
    return view
  }()
  
  private lazy var spinner: UIActivityIndicatorView = {
    let activityView = UIActivityIndicatorView(style: .large)
    activityView.center = viewLoader.center
    activityView.color = UIColor(named: "main")
    return activityView
  }()
  
  private let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "person.circle")
    return imageView
  }()
  
  private let profileLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .medium)
    label.text = "Olá, Fulano"
    return label
  }()
  
  lazy var spotlightCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.register(SpotlightCollectionCellView.self,
                            forCellWithReuseIdentifier: SpotlightCollectionCellView.identifier)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.contentMode = .center
    return collectionView
  }()
  
  let cashView: UIView = {
    let view = UIView(frame: .zero)
    view.isUserInteractionEnabled = true
    return view
  }()
  private let cashTitleLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  private let cashImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleToFill
    imageView.layer.cornerRadius = 8
    imageView.clipsToBounds = true
    return imageView
  }()
  
  private let productsView: UIView = {
    let view = UIView(frame: .zero)
    view.isUserInteractionEnabled = true
    return view
  }()
  
  private let productTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Produtos"
    label.font = .boldSystemFont(ofSize: 21)
    label.textColor = UIColor(named: "main")
    return label
  }()
  
  lazy var productsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.register(ProductsCollectionCellView.self,
                            forCellWithReuseIdentifier: ProductsCollectionCellView.identifier)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.contentMode = .center
    collectionView.isScrollEnabled = true
    return collectionView
  }()
  
  override func initialize() {
    addComponents()
    setupExtraConfigurations()
  }
  
  // MARK: - Constraints
  
  override func installConstraints() {
    containerView.anchorEqualTo(view: contentView)
    viewLoader.anchorEqualTo(view: contentView)
    installContraintsHeaderView()
  }
}

private extension HomeView {
  func addComponents() {
    headerView.addSubviews([profileImageView,
                            profileLabel],
                           enableConstraints: true)
    
    cashView.addSubviews([cashTitleLabel,
                          cashImageView],
                         enableConstraints: true)
    
    productsView.addSubviews([productTitleLabel,
                              productsCollectionView],
                             enableConstraints: true)
    
    containerView.addSubviews([headerView,
                               spotlightCollectionView,
                               cashView,
                               productsView],
                              enableConstraints: true)
    
    viewLoader.addSubview(spinner, enableConstraints: true)
    
    contentView.addSubviews([containerView,
                             viewLoader],
                            enableConstraints: true)
  }
  
  func setupExtraConfigurations() {
    backgroundColor = .white
  }
  
  func installContraintsHeaderView() {
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: containerView.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
      headerView.heightAnchor.constraint(equalToConstant: 40),
      
      profileImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
      profileImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
      profileImageView.heightAnchor.constraint(equalToConstant: 36),
      profileImageView.widthAnchor.constraint(equalToConstant: 36),
      
      profileLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
      profileLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
      
      spotlightCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
      spotlightCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
      spotlightCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
      spotlightCollectionView.heightAnchor.constraint(equalToConstant: 200),
      
      cashView.topAnchor.constraint(equalTo: spotlightCollectionView.bottomAnchor, constant: 24),
      cashView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
      cashView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
      cashView.heightAnchor.constraint(equalToConstant: 170),
      
      cashTitleLabel.topAnchor.constraint(equalTo: cashView.topAnchor),
      cashTitleLabel.leadingAnchor.constraint(equalTo: cashView.leadingAnchor),
      cashTitleLabel.trailingAnchor.constraint(equalTo: cashView.trailingAnchor),
      
      cashImageView.topAnchor.constraint(equalTo: cashTitleLabel.bottomAnchor, constant: 8),
      cashImageView.leadingAnchor.constraint(equalTo: cashView.leadingAnchor),
      cashImageView.trailingAnchor.constraint(equalTo: cashView.trailingAnchor),
      cashImageView.bottomAnchor.constraint(equalTo: cashView.bottomAnchor),
      
      productsView.topAnchor.constraint(equalTo: cashView.bottomAnchor, constant: 24),
      productsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
      productsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
      productsView.heightAnchor.constraint(equalToConstant: 200),
      
      productTitleLabel.topAnchor.constraint(equalTo: productsView.topAnchor),
      productTitleLabel.leadingAnchor.constraint(equalTo: productsView.leadingAnchor),
      productTitleLabel.trailingAnchor.constraint(equalTo: productsView.trailingAnchor),
      
      productsCollectionView.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor),
      productsCollectionView.leadingAnchor.constraint(equalTo: productsView.leadingAnchor),
      productsCollectionView.trailingAnchor.constraint(equalTo: productsView.trailingAnchor),
      productsCollectionView.heightAnchor.constraint(equalToConstant: 140),
      
      spinner.centerXAnchor.constraint(equalTo: viewLoader.centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: viewLoader.centerYAnchor)
    ])
  }
}

extension HomeView {
  func showLoader(_ show: Bool) {
    containerView.isHidden = show
    viewLoader.isHidden = !show
    
    if show {
      spinner.startAnimating()
    } else {
      spinner.stopAnimating()
    }
  }
  
  func setCashTitle(_ title: String) {
    let attMain = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22),
                NSAttributedString.Key.foregroundColor : UIColor(named: "main")]
    
    let attSecondary = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22),
                NSAttributedString.Key.foregroundColor : UIColor(named: "secondary")]
    
    let split = title.components(separatedBy: " ")
    let main = split.count == 1 ? split[0] : "digio"
    let secondary = split.count == 1 ? split[1] : "cash"
    
    let stylizedTitleMain = NSMutableAttributedString(string: main,
                                                      attributes: attMain as [NSAttributedString.Key : Any])
    
    let space = NSMutableAttributedString(string: " ",
                                          attributes: attMain as [NSAttributedString.Key : Any])
    
    let stylizedTitleSecondary = NSMutableAttributedString(string: secondary,
                                                      attributes: attSecondary as [NSAttributedString.Key : Any])
    
    stylizedTitleMain.append(space)
    stylizedTitleMain.append(stylizedTitleSecondary)
    self.cashTitleLabel.attributedText = stylizedTitleMain
  }
  
  func setCashBanner(_ path: String) {
    cashImageView.downloaded(from: path)
  }
}
