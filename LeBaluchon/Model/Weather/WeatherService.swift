//
//  weatherService.swift
//  LeBaluchon
//
//  Created by Pierre on 02/09/2021.
//

import Foundation

final class WeatherService {

    // MARK: - Properties

    private let session: URLSession
    private let baseStringURL: String = "http://api.openweathermap.org/data/2.5/group?"

    // MARK: - Initializer

    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    // MARK: - Methods
    
    func getWeather(callback: @escaping (Result<WeatherApi, NetworkErrors>) -> Void) {
        guard let baseURL: URL = .init(string: baseStringURL) else { return }
        let url : URL = encode(with: baseURL, and: [("id","2988507,5128581"), ("units", "metric"), ("appid", "be1be5d48dcaafb96f5e605dbac4a4ed"), ("lang", "fr") ])
        print(url)
       
        #if DEBUG
        NetworkLogger(url: url).show()
        #endif
        session.dataTask(with: url, callback: callback)
    }
}

extension WeatherService: URLEncodable {}
