//
//  ViewController.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 13/03/24.
//

import UIKit

var spotLightDataStore: [SpotlightMock] = [
  .init(name: "Recarga",
        bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
        description: "lore ipso"),
  .init(name: "Uber",
        bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
        description: "lore ipson")
]

var cashDataStore: CashtMock = .init(title: "digio Cash",
                                     bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
                                     description: "Dinheiro na conta sem complicação. Transfira parte do limite do seu cartão para sua conta.")

var productsDataStore: [ProductsMock] = [
  .init(name: "XBOX",
        imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
        description: ""),
  .init(name: "Google Play",
        imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/google_play_icon.png",
        description: ""),
  .init(name: "Level up",
        imageURL: "https://cdn-icons-png.flaticon.com/512/6708/6708069.png",
        description: "")
]

class ViewController: UIViewController {
  
  @IBOutlet weak var viewLoading: UIView!
  @IBOutlet weak var contentView: UIView!
  
  @IBOutlet weak var mainTableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.viewLoading.isHidden = true
      self.contentView.isHidden = false
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    viewLoading.isHidden = false
    contentView.isHidden = true
  }
}

extension ViewController: UITableViewDelegate {
  
}

extension ViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cellSpotlight", for: indexPath) as! SpotlightTableViewCell
      cell.bannersCollectionView.tag = indexPath.section
      
      return cell
    } else if indexPath.row == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cellCash", for: indexPath) as! CashTableViewCell
      cell.bannerImageView.downloaded(from: cashDataStore.bannerURL)
      cell.setTitle(cashDataStore.title)
      
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cellProducts", for: indexPath) as! ProductsTableViewCell
      cell.bannerCollectionView.tag = indexPath.section
      
      return cell
    }
  }
}
