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

// MARK: - Translate
struct TranslateResponse: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let translations: [Translation]
}

struct Translation: Codable {
    let translatedText: String
    let detectedSourceLanguage: String
}


// MARK: - Weather
struct WeatherApi: Codable {
    let list: [List]
}

struct List: Codable {
    let weather: [WeatherElement]
    let main: Main
}

struct Main: Codable {
    let temp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
}

struct WeatherElement: Codable {
    let id: Int
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case id
        case weatherDescription = "description"
    }
}
