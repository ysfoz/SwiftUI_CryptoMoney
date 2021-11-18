//
//  WebService.swift
//  SwiftUI_CyrptoMoney
//
//  Created by ysf on 18.11.21.
//

import Foundation




class Webservice {
    
  // with async await
    func downloadCurrenciesAsync(url: URL) async throws -> [CryptoCurrency] {
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
    
    }
    
    
    // old version
    func downloadCurrencies(url : URL, completion: @escaping (Result<[CryptoCurrency]?, DownloaderError>)-> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badURL))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataPArseError))
            }
            
            completion(.success(currencies))
        }.resume()
    }
}

enum DownloaderError : Error {
    case badURL
    case noData
    case dataPArseError
}

