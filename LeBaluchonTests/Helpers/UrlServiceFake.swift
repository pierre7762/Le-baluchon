//
//  urlServiceFake.swift
//  LeBaluchonTests
//
//  Created by Pierre on 23/09/2021.
//

import Foundation
@testable import LeBaluchon

final class UrlServiceFake {

    // MARK: - Properties

    private let baseStringURL: String = "https://www.test.fr/baseUrl"

    // MARK: - Methods
    
    func buildUrlRequest(param: [(String, Any)]) -> String {
        guard let baseURL: URL = .init(string: baseStringURL) else { return ""}
        let url : URL = encode(with: baseURL, and: param)
        let urlString = url.absoluteString
        
        return urlString
    }
}

extension UrlServiceFake: URLEncodable {}
