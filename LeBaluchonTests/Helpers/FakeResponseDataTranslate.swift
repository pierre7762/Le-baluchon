//
//  FakeResponseDataTranslate.swift
//  LeBaluchonTests
//
//  Created by Pierre on 10/09/2021.
//

import Foundation

class FakeResponseDataTranslate {
    static let url: URL = URL(string: "https://translation.googleapis.com/language/translate/v2?")!
    static let responseOK = HTTPURLResponse(url: URL(string: "https://translation.googleapis.com/language/translate/v2?")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://translation.googleapis.com/language/translate/v2?")!, statusCode: 500, httpVersion: nil, headerFields: nil)!

    class NetworkError: Error {}
    static let error = NetworkError()

    static var correctData: Data {
        let bundle = Bundle(for: FakeResponseDataTranslate.self)
        let url = bundle.url(forResource: "BinaryConverter", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }

    static let incorrectData = "erreur".data(using: .utf8)!
}
