//
//  Converter.swift
//  LeBaluchon
//
//  Created by Pierre on 09/07/2021.
//

import Foundation

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
        var result = 0.0
        if startingCurrencies == .dollar {
            result = Double(round(100 * (startedValue * rateDollarToEuro))/100)
        } else {
            result = Double(round(100 * (startedValue * rateEuroToDollar))/100)
        }
        return String(result)
    }
    
    private mutating func determineTheExchangeRateDollarToEuroFromEuroToDollar() -> Double {
        Double(round(1000000*(1/self.rateEuroToDollar))/1000000)
    }
    
    private mutating func updateCurrencyOfTheResult() -> CurrenciesList {
        if startingCurrencies == .dollar {
            return .euros
        }
        return .dollar
    }
    
    private func giveSymbolCurrencies(currencie: CurrenciesList) -> String {
        if currencie == .dollar {
            return "$"
        }
        return "€"
    }
}
