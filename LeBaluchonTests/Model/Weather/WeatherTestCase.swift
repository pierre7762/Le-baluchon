//
//  WeatherTestCase.swift
//  LeBaluchonTests
//
//  Created by Pierre on 03/09/2021.
//

import XCTest
@testable import LeBaluchon

class WeatherTestCase: XCTestCase {
    var weath: Weather!
    
    override func setUp() {
        super.setUp()
        weath = Weather(cityName: "test")
    }
    
    func testGivenTheObjectIsEmpty_WhenWeUpdateDataFromApiWhithCodeId_ThenCodeImageIsOk() {
        weath.skyStateCode = 200
        weath.temperature = 15
        
        let resultExpected = ["thunderstorm","15 °C"]
        let resultReal = [weath.image, weath.temperatureString]
        
        XCTAssertEqual(resultReal, resultExpected)
    }
    
    func testGivenTheObjectIsEmpty_WhenWeAddADescription_ThenFirstLettreIsAnUppercase() {
        weath.description = "test"
        
        let resultExpected = "Test"
        let resultReal = weath.descriptionWithFirstLetterUppercase
        
        XCTAssertEqual(resultReal, resultExpected)
    }
    
    func testGivenTheObjectIsEmpty_WhenWeUpdateDataFromApiWhithCodeId_ThenAllImageAresOk() {
        let allInitialValues = [200, 300, 600, 700, 800, 801, 802, 803, 804]
        var resultReal: [String] = []
        let resultExpected = ["thunderstorm", "rain", "snow", "mist", "clearSky", "fewClouds", "scatteredClouds", "cloudy", "cloudy"]
        
        for items in allInitialValues {
            weath.skyStateCode = items
            resultReal.append(weath.image)
        }
 
        XCTAssertEqual(resultReal, resultExpected)
    }
    
    
}

