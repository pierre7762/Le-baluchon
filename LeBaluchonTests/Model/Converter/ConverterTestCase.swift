//
//  ConverterTestCase.swift
//  LeBaluchonTests
//
//  Created by Pierre on 03/09/2021.
//

import XCTest

@testable import LeBaluchon

class ConverterTestCase: XCTestCase {
    
    var convert: Converter!
    
    override func setUp() {
        super.setUp()
        convert = Converter(startingCurrencies: .dollar)
    }
    
    func testGivenTheAppStart_WhenTheApiGiveTheEuroToDollar_ThenReturnDollarRateToEuro() {
        convert.rateEuroToDollar = 2.0
        let resultExpected = 0.5
        
        XCTAssertEqual(convert.rateDollarToEuro, resultExpected)
    }

    func testGivenTheApiReturnRate_WhenGiveAnStartedValue_ThenReturnTheValueConverted() {
        convert.rateEuroToDollar = 0.5
        var realResult: [String] = []
        let resultExpected = ["1.5", "6.0"]
        
        convert.startingCurrencies = .euros
        convert.startedValue = 3.0
        realResult.append(convert.result)
        
        convert.startingCurrencies = .dollar
        realResult.append(convert.result)
        
        XCTAssertEqual(realResult, resultExpected)
    }
    
    func testGivenTheAppStart_WhenStartingCurrenciesIsDollar_ThencurrencyOfTheResultIsEuro() {
        convert.startingCurrencies = .dollar

        XCTAssertEqual(convert.currencyOfTheResult, .euros)
    }

}
