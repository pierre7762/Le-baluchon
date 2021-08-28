//
//  TranslateService.swift
//  LeBaluchon
//
//  Created by Pierre on 27/08/2021.
//

import Foundation

final class TranslateService {

    // MARK: - Properties

    private let session: URLSession
    private let baseStringURL: String = "https://translation.googleapis.com/language/translate/v2?"

    // MARK: - Initializer

    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    // MARK: - Methods
    
    func getTranslation(callback: @escaping (Result<TranslateResponse, NetworkErrors>) -> Void,  textToTranslate: String, languageTarget: String) {
        guard let baseURL: URL = .init(string: baseStringURL) else {
            callback(.failure(.invalidURL))
            return
        }
        let url : URL = encode(with: baseURL, and: [("key", "AIzaSyAqOptFYO5x8Cz8KHX2rsaCCRepNmF67Vk"),("format", "text"), ("q",textToTranslate), ("target", languageTarget)])
        print(url)
       
        #if DEBUG
        NetworkLogger(url: url).show()
        #endif
        session.dataTask(with: url, callback: callback)
    }
}

extension TranslateService: URLEncodable {}
