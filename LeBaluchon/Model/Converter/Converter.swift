//
//  Converter.swift
//  LeBaluchon
//
//  Created by Pierre on 09/07/2021.
//

import Foundation
import UIKit

struct Converter {
    var startingCurrencies: CurrenciesList
    var startingCurrenciesSymbole: String {
        get {
            giveSymbolCurrencies(currencie: startingCurrencies)
        }
    }
    var startedValue: Double = 0.0
    var rateEuroToDollar: Double = 0.0
    var rateDollarToEuro: Double {
        mutating get {
            determineTheExchangeRateDollarToEuroFromEuroToDollar()
        }
    }
    var currencyOfTheResult : CurrenciesList {
        mutating get {
            updateCurrencyOfTheResult()
        }
    }
    var currencyOfTheResultSymbole: String {
        mutating get {
            giveSymbolCurrencies(currencie: currencyOfTheResult)
        }
    }
    var result : String {
        mutating get {
            convertedStartedValueWithexchangeRate()
        }
    }
    
    var dateOfLastUpdate: Date?
    
    enum CurrenciesList {
        case dollar
        case euros
    }
    
    mutating func convertedStartedValueWithexchangeRate() -> String {
        if startingCurrencies == .dollar {
            let result = Double(round(100 * (startedValue * rateDollarToEuro))/100)
            return String(result)
        } else {
            let result = Double(round(100 * (startedValue * rateEuroToDollar))/100)
            return String(result)
        }
    }
    
    private mutating func determineTheExchangeRateDollarToEuroFromEuroToDollar() -> Double {
        Double(round(1000000*(1/self.rateEuroToDollar))/1000000)
    }
    
    mutating func updateView(textTopOfSegmented: UILabel, resultLabel: UILabel) {
        textTopOfSegmented.text = "Devise de départ -> \(self.startingCurrenciesSymbole)"
        
        if self.startingCurrencies == .dollar {
            resultLabel.text = "\(self.result) \(self.currencyOfTheResultSymbole) \n taux(\(self.rateDollarToEuro))"
        } else {
            resultLabel.text = "\(self.result) \(self.currencyOfTheResultSymbole) \n taux(\(self.rateEuroToDollar))"
        }
    }
    
    private mutating func updateCurrencyOfTheResult() -> CurrenciesList {
        if startingCurrencies == .dollar {
            return CurrenciesList.euros
        } else {
            return CurrenciesList.dollar
        }
    }
    
    private func giveSymbolCurrencies(currencie: CurrenciesList) -> String {
        if currencie == .dollar {
            return "$"
        } else {
            return "€"
        }
    }
}
