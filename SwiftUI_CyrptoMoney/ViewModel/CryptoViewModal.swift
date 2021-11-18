//
//  CryptoViewModal.swift
//  SwiftUI_CyrptoMoney
//
//  Created by ysf on 18.11.21.
//

import Foundation

class CryptoListViewModel : ObservableObject {
    
    // observable yani izenebilir, firebase deki listenir gibi, her degisiklilgi kullnildigi vieew bildiri. @published yazdigimi degiskeni takip ediyor.
    
    @Published var cryptoList = [CryptoViewModal]()
    
    let webservice = Webservice()
    
    func downloadCryptos(url: URL) {
        webservice.downloadCurrencies(url: url) { result in
            switch result {
            case .failure(let error):
                print(error)
            
            case .success(let cryptos):
                if let cryptos = cryptos {
                    
                    // bu kisim main user interface ile ilgili olgugun icin main icersinde yapiyoruz.
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModal.init)
                    }
                    
                }
            }
        }
    }
    
}




struct CryptoViewModal {
    
    let crypto : CryptoCurrency
    
    var id: UUID? {
        crypto.id
    }
    var currency : String {
        crypto.currency
    }
    var price : String {
        crypto.price
    }
    
}
