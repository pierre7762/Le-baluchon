//
//  FakeResponseDataConverter.swift
//  LeBaluchonTests
//
//  Created by Pierre on 10/09/2021.
//

import Foundation

class FakeResponseData {
    static let currencyUrl: URL = URL(string: "http://data.fixer.io/api/latest?access_key=d95d422992002c68a33a9a9766fa1dcf")!
    static let translateUrl: URL = URL(string: "https://translation.googleapis.com/language/translate/v2?key=AIzaSyAqOptFYO5x8Cz8KHX2rsaCCRepNmF67Vk&format=text&q=Bonjour&target=en")!
    static let weatherUrl: URL = URL(string: "http://api.openweathermap.org/data/2.5/group?id=2988507,5128581&units=metric&appid=be1be5d48dcaafb96f5e605dbac4a4ed&lang=fr")!
    static let responseOK = HTTPURLResponse(url: URL(string: "http://test.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "http://test.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!

    class NetworkError: Error {}
    static let error = NetworkError()

    static var correctDataConverter: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "fixer", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static var correctDataTranslate: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "translate", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static var correctDataWeather: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "weather", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }

    static let incorrectData = "erreur".data(using: .utf8)!
}
