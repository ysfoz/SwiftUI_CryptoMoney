//
//  ContentView.swift
//  SwiftUI_CyrptoMoney
//
//  Created by ysf on 18.11.21.
//

import SwiftUI

struct MainView: View {
    
    //viewmodal de gozlemlenen object
    @ObservedObject var cryptoListViewModal : CryptoListViewModel
    
    init(){
        self.cryptoListViewModal = CryptoListViewModel()
    }
    
    
    
    var body: some View {
        NavigationView {
            List(cryptoListViewModal.cryptoList,id:\.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                    Text(crypto.price)
                        .foregroundColor(.black)
                }
                
            }.toolbar(content: {
                Button {
                    //button icersinde async func calistirmak
                    Task.init {
                        await cryptoListViewModal.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                    }
                      } label: {
                    Text("Refresh")
                }

            })
            
            .navigationBarTitle(Text("Crypto Money"))
        }.task {
            await cryptoListViewModal.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            
        }
        
        // old version
        
//        .onAppear {
            
           
//            cryptoListViewModal.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
