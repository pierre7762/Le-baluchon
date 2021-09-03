//
//  ConverterTestCase.swift
//  LeBaluchonTests
//
//  Created by Pierre on 03/09/2021.
//

import XCTest
import UIKit
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
    
    func testGiven_When_Then() {
        let labelTop = UILabel()
        labelTop.text = "start"
        let resultLabel = UILabel()
        resultLabel.text = "start"
        convert.startingCurrencies = .dollar
        convert.startedValue = 6
        convert.rateEuroToDollar = 2
        let resultExpected = "3.0"
        
        convert.updateView(textTopOfSegmented: labelTop, resultLabel: resultLabel)
        
        
        
        XCTAssertEqual(convert.result, resultExpected)
    }

}
