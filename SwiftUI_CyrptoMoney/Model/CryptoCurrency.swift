//
//  CryptoCurrency.swift
//  SwiftUI_CyrptoMoney
//
//  Created by ysf on 18.11.21.
//

import Foundation


struct CryptoCurrency : Hashable, Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    //codingKeys ile hem json formatinda id gelmedi icin idleri eklemis oluyoruz, hem de , degisken isimleri cok farkli isimlerde gelirse onlari duzeltmis oluyoruz
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
}
