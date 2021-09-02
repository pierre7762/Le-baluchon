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
    let cnt: Int
    let list: [List]
}

struct List: Codable {
    let coord: Coord
    let sys: Sys
    let weather: [WeatherElement]
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt, id: Int
    let name: String
}

struct Clouds: Codable {
    let all: Int
}

struct Coord: Codable {
    let lon, lat: Double
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

struct Sys: Codable {
    let country: String
    let timezone, sunrise, sunset: Int
}

struct WeatherElement: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}
