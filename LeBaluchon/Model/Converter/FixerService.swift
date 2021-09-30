//
//  FixerService.swift
//  LeBaluchon
//
//  Created by Sebastien Bastide on 16/07/2021.
//

import Foundation

enum NetworkError: Error {
    case invalidURL, noData, badResponse, undecodableData
}

final class FixerService {

    // MARK: - Properties

    private let session: URLSession
    private var task: URLSessionDataTask?
    private let baseStringURL: String = "http://data.fixer.io/api/latest"
    private let fixerKey = ApiKeys().fixerKey

    // MARK: - Initializer

    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    // MARK: - Methods
    
    func getExchangeRate(callback: @escaping (Result<ExchangeRating, NetworkErrors>) -> Void) {
        guard let baseURL: URL = .init(string: baseStringURL) else { return }
        let url : URL = encode(with: baseURL, and: [("access_key", fixerKey)])
        NetworkLogger(url: url).show()
        #if DEBUG
        task?.cancel()
        #endif
        session.dataTask(with: url, callback: callback)
    }
}

extension FixerService: URLEncodable {}
