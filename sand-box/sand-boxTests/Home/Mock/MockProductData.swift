//
//  MockProductData.swift
//  sand-boxTests
//
//  Created by Rodrigo Queiroz on 18/03/24.
//

import Foundation

class MockProductData {
  func createMockSuccess() -> ProductData {
    ProductData(
      spotlights: [
        Spotlight(
          name: "Recarga",
          bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
          description: "Agora ficou mais fácil colocar créditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurança e praticidade que você procura."
        )
      ],
      cash: Cash(
        title: "digio Cash",
        bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
        description: "Dinheiro na conta sem complicação. Transfira parte do limite do seu cartão para sua conta."
      ),
      products: [
        Product(
          name: "XBOX",
          imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
          description: "com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!"
        )
      ]
    )
  }
  
  func createMockFail() -> Error {
    return DataError.invalidResponse
  }
  
  func createMockEmpty() -> ProductData {
    ProductData(
      spotlights: [
        Spotlight(
          name: "",
          bannerURL: "",
          description: ""
        )
      ],
      cash: Cash(
        title: "",
        bannerURL: "",
        description: ""
      ),
      products: [
        Product(
          name: "",
          imageURL: "",
          description: ""
        )
      ]
    )
  }
}
