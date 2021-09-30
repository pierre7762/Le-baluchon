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
    private let translaterKey = ApiKeys().translaterKey

    // MARK: - Initializer

    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    // MARK: - Methods
    
    func getTranslation(textToTranslate: String,
                        languageTarget: String,
                        callback: @escaping (Result<TranslateResponse, NetworkErrors>) -> Void) {
        guard let baseURL: URL = .init(string: baseStringURL) else { return }
        let url : URL = encode(with: baseURL, and: [("key", translaterKey),("format", "text"), ("q",textToTranslate), ("target", languageTarget)])
        print(url)
       
        #if DEBUG
        NetworkLogger(url: url).show()
        #endif
        session.dataTask(with: url, callback: callback)
    }
}

extension TranslateService: URLEncodable {}
