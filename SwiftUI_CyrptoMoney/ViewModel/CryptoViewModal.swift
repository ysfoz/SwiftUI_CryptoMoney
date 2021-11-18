//
//  CryptoViewModal.swift
//  SwiftUI_CyrptoMoney
//
//  Created by ysf on 18.11.21.
//

import Foundation


// bu sekilde mainActor olarak tanimlarsak buradaki tum propertyler main thread de islme gorur, bu yuzden dispatchqueue kullanmaya gerek kalmaz
@MainActor
class CryptoListViewModel : ObservableObject {
    
    // observable yani izenebilir, firebase deki listenir gibi, her degisiklilgi kullnildigi vieew bildiri. @published yazdigimi degiskeni takip ediyor.
    
    @Published var cryptoList = [CryptoViewModal]()
    
    let webservice = Webservice()
    
    // async await version
    func downloadCryptosAsync (url:URL) async {
        do{
       let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
            self.cryptoList = cryptos.map(CryptoViewModal.init)
            
//            DispatchQueue.main.async {
//                self.cryptoList = cryptos.map(CryptoViewModal.init)
//            }
        } catch {
            print("error")
        }
    }
    
    // old version
    
    /*
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
     */
    
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
