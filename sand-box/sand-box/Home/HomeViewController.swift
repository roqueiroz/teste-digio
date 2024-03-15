//
//  HomeViewController.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 14/03/24.
//

import UIKit

let images = ["https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
              "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png"]

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
  
}

private extension HomeViewController {
  func fetchProducts() {
    viewModel.spotlightCollectionDataSource.models = [
      .init(.init(name: "Recarga",
                  bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
                  description: "Agora ficou mais fácil colocar créditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurança e praticidade que você procura.")),
      .init(.init(name: "Uber",
                  bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                  description: "Dê um vale presente Uber para amigos e familiares, ou use os vales para adicionar créditos à sua conta. O app Uber conecta você a uma viagem confiável em apenas alguns minutos. Você pode escolher entre as opções econômicas ou Premium para viajar do seu jeito. O pagamento é fácil e sem complicações!"))]
    
    viewModel.productsCollectionDataSource.models = [
      .init(product: .init(name: "XBOX",
                           imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
                           description: "")),
      .init(product: .init(name: "Google Play",
                           imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/google_play_icon.png",
                           description: "")),
      .init(product: .init(name: "Level up",
                           imageURL: "https://cdn-icons-png.flaticon.com/512/6708/6708069.png",
                           description: ""))
    ]
  }
  
  func setupBinds() {
    self.baseView.spotlightCollectionView.dataSource = viewModel.spotlightCollectionDataSource
    self.baseView.spotlightCollectionView.delegate = self
    self.baseView.setCashTitle("digio Cash")
    self.baseView.setCashBanner("https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png")
    
    self.baseView.productsCollectionView.dataSource = viewModel.productsCollectionDataSource
    self.baseView.productsCollectionView.delegate = self
    
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
    
  }
}
