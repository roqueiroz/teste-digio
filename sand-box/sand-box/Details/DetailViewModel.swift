//
//  DetailViewModel.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 17/03/24.
//

import Foundation

protocol DetailViewModelProcotol: AnyObject {
  var detailModel: DetailModel { get }
}

class DetailViewModel {
  var detailModel: DetailModel
  
  init(detailModel: DetailModel) {
    self.detailModel = detailModel
  }
}

extension DetailViewModel: DetailViewModelProcotol {
  
}
