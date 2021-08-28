//
//  APIResponse.swift
//  LeBaluchon
//
//  Created by Pierre on 09/07/2021.
//

import Foundation

// MARK: - ExchangeRating
struct ExchangeRating: Decodable {
    let rates: [String: Double]
}

// MARK: - TranslateResponse
struct TranslateResponse: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let translations: [Translation]
}

// MARK: - Translation
struct Translation: Codable {
    let translatedText: String
    let detectedSourceLanguage: String
}

