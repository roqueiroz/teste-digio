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
/*
 
 
 {
   "name": "XBOX",
   "imageURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
   "description": "Com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!"
 },
 {
   "name": "Google Play",
   "imageURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/google_play_icon.png",
   "description": "O e-gift Google Play dá acesso a um mundo de entretenimento. É muito fácil encontrar algo que você goste, seja você um fã de música ou de filmes, livros, revistas, apps ou jogos. Com o e-gift Google Play, você não precisa de cartão de crédito e pode aproveitar o melhor do cinema, suas músicas favoritas e muito mais em smartphones e tablets Android, iOS e também no computador."
 },
 {
   "name": "Level up",
   "imageURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/level_up_icon.png",
   "description": "Com o e-Gift Card Level Up você adquire créditos para jogar diversas opções de games, de MMORPGs a jogos de Tiro e Mobas! Para ver a lista de jogos e a quantia de créditos que pode resgatar em cada um deles, acesse: http://levelupgames.uol.com.br/levelup/seuegiftcard.lhtml"
 }
 **/




class ViewController: UIViewController {
  
  @IBOutlet weak var mainTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
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
