//
//  Weather.swift
//  LeBaluchon
//
//  Created by Pierre on 02/09/2021.
//

import Foundation


struct Weather {
    let cityName: String
    var temperature: Double = 0.0
    var temperatureString: String {
        "\(String(Int(temperature))) °C"
    }
    var skyStateCode : Int = 0
    var description: String = ""
    var descriptionWithFirstLetterUppercase: String {
        description.capitalizingFirstLetter()
    }
    var image: String {
        renderLogoWeather()
    }
    
    enum weatherCode {
        case thunderstorm
        case drizzle
        case rain
        case snow
        case atmosphere
        case clear
        case clouds
    }
    
    func renderLogoWeather() -> String {
        var goodImage = ""
        
        if skyStateCode >= 300 && skyStateCode <= 232  {
            goodImage = "thunderstorm"
        } else if skyStateCode >= 200 && skyStateCode <= 531  {
            goodImage = "rain"
        } else if skyStateCode >= 600 && skyStateCode <= 622  {
            goodImage = "snow"
        } else if skyStateCode >= 700 && skyStateCode <= 781  {
            goodImage = "mist"
        } else if skyStateCode == 800 {
            goodImage = "clearSky"
        } else if skyStateCode == 801{
            goodImage = "fewClouds"
        } else if skyStateCode == 802  {
            goodImage = "scatteredClouds"
        } else if skyStateCode == 803 || skyStateCode == 804  {
            goodImage = "cloudy"
        }
        
        
        return goodImage
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
