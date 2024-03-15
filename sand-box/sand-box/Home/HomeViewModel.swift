//
//  HomeViewModel.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
  var spotlightCollectionDataSource: CollectionViewDataSource<SpotlightCollectionCellViewModel> { get }
  var productsCollectionDataSource: CollectionViewDataSource<ProductsCollectionCellViewModel> { get }
  var cash: Cash? { get }
  
  func fetchProducts(completion: @escaping (Result<Void, Error>) -> Void)
}

class HomeViewModel {
  let spotlightCollectionDataSource: CollectionViewDataSource<SpotlightCollectionCellViewModel> = .make(for: [])
  let productsCollectionDataSource: CollectionViewDataSource<ProductsCollectionCellViewModel> = .make(for: [])
  var cash: Cash?
}

extension HomeViewModel: HomeViewModelProtocol {
  func fetchProducts(completion: @escaping (Result<Void, Error>) -> Void) {
    APIManager.shared.fetchData { [weak self] result in
      guard let self else { return }
      switch result {
        case let .success(model):
          spotlightCollectionDataSource.models = model.spotlights.map { spotlight in
            SpotlightCollectionCellViewModel(spotlight)
          }
          productsCollectionDataSource.models = model.products.map({ product in
            ProductsCollectionCellViewModel(product: product)
          })
          cash = model.cash
          
          completion(.success(()))
        case let .failure(error):
          completion(.failure(error))
          break
      }
    }
  }
  
//  func get
}

extension CollectionViewDataSource where Model == SpotlightCollectionCellViewModel {
  static func make(for models: [SpotlightCollectionCellViewModel],
                   reuseIdentifier: String = SpotlightCollectionCellView.identifier) -> CollectionViewDataSource<Model> {
    return CollectionViewDataSource(models: models,
                                    reuseIdentifier: SpotlightCollectionCellView.identifier) { model, cell in
      if let cell = cell as? SpotlightCollectionCellView {
        model.configure(cell)
      }
    }
  }
}

extension CollectionViewDataSource where Model == ProductsCollectionCellViewModel {
  static func make(for models: [ProductsCollectionCellViewModel],
                   reuseIdentifier: String = ProductsCollectionCellView.identifier) -> CollectionViewDataSource<Model> {
    return CollectionViewDataSource(models: models,
                                    reuseIdentifier: ProductsCollectionCellView.identifier) { model, cell in
      if let cell = cell as? ProductsCollectionCellView {
        model.configure(cell)
      }
    }
  }
}
