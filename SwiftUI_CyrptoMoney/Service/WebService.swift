//
//  WebService.swift
//  SwiftUI_CyrptoMoney
//
//  Created by ysf on 18.11.21.
//

import Foundation


class Webservice {
    func downloadCurrencies(url : URL, completion: @escaping (Result<[CrypteCurrency]?, DownloaderError>)-> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badURL))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CrypteCurrency].self, from: data) else {
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

