//
//  CryptoViewModal.swift
//  SwiftUI_CyrptoMoney
//
//  Created by ysf on 18.11.21.
//

import Foundation

class CryptoListViewModel : ObservableObject {
    
    let webservice = Webservice()
    
    func downloadCryptos() {
//        webservice.downloadCurrencies
    }
    
    
    
    
}




struct CryptoViewModal {
    
    let crypto : CrypteCurrency
    
    var id: UUID? {
        crypto.id
    }
    var currency : String {
        crypto.currency
    }
    var pirce : String {
        crypto.price
    }
    
}
