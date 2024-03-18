//
//  DetailViewController.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import UIKit

class DetailViewController: BaseViewController<DetailView> {
  
  let viewModel: DetailViewModelProcotol
  
  init(viewModel: DetailViewModelProcotol) {
    self.viewModel = viewModel
    super.init()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBinds()
  }
}

extension DetailViewController {
  func setupBinds() {
    baseView.setBanner(viewModel.detailModel.bannerURL)
    baseView.setTitle(viewModel.detailModel.title)
    baseView.setDescription(viewModel.detailModel.description)
  }
}
