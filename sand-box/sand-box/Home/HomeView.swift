//
//  HomeView.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

final class HomeView: BaseScrollView {
  
  let containerView = UIView()
  let headerView = UIView()
  
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
  
  private let cashView: UIView = {
    let view = UIView(frame: .zero)
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
    
    contentView.addSubview(containerView,
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
      
    ])
  }
}

extension HomeView {
  func setCashTitle(_ title: String) {
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
    self.cashTitleLabel.attributedText = attributedString1
  }
  
  func setCashBanner(_ path: String) {
    cashImageView.downloaded(from: path)
  }
}
