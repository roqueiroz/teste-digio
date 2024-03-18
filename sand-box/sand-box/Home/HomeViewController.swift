//
//  HomeViewController.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

final class HomeViewController: BaseScrollViewController<HomeView> {
  let viewModel: HomeViewModelProtocol
  
  init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
    self.viewModel = viewModel
    super.init()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchProducts()
    setupBinds()
  }
  
  @objc
  private func didTapView() {
    viewModel.didSelectCash()
  }
}

private extension HomeViewController {
  func fetchProducts() {
    baseView.showLoader(true)
    
    viewModel.fetchProducts { [weak self] result in
      guard let self else { return }
      DispatchQueue.main.async {
        self.baseView.showLoader(false)
        switch result {
          case .success:
            self.baseView.spotlightCollectionView.reloadData()
            self.baseView.productsCollectionView.reloadData()
            self.baseView.setCashTitle(self.viewModel.cash?.title ?? "")
            self.baseView.setCashBanner(self.viewModel.cash?.bannerURL ?? "")
            self.showContentView(true)
          case .failure(_):
            self.showContentView(false)
            self.showError()
        }
      }
    }
  }
  
  func showError() {
    ErroView.show(error: "Ops..\n Algo deu errado!", in: self, action: .retry) { [weak self] in
      guard let self else { return }
      self.fetchProducts()
    }
  }
  
  func showContentView(_ show: Bool) {
    baseView.showLoader(false)
    baseView.scrollView.isHidden = !show
  }
  
  func setupBinds() {
    self.viewModel.delegate = self
    self.baseView.spotlightCollectionView.dataSource = viewModel.spotlightCollectionDataSource
    self.baseView.spotlightCollectionView.delegate = self
    self.baseView.productsCollectionView.dataSource = viewModel.productsCollectionDataSource
    self.baseView.productsCollectionView.delegate = self
    let tap = UITapGestureRecognizer(target: self,
                                     action: #selector(didTapView))
    self.baseView.cashView.addGestureRecognizer(tap)
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == self.baseView.spotlightCollectionView {
      return CGSize(width: 340, height: 178)
    } else {
      return CGSize(width: 140, height: 120)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == baseView.spotlightCollectionView {
      viewModel.didSelectSpotligh(at: indexPath)
    }
    
    if collectionView == baseView.productsCollectionView {
      viewModel.didSelectProduct(at: indexPath)
    }
  }
}

extension HomeViewController: HomeViewModelDelegate {
  func openDetail(_ detailModel: DetailModel) {
    let detailViewModel = DetailViewModel(detailModel: detailModel)
    let modal = DetailViewController(viewModel: detailViewModel)
    modal.modalPresentationStyle = .formSheet
    self.present(modal, animated: true)
  }
}
