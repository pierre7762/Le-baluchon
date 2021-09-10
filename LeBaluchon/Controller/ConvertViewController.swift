//
//  ConvertViewController.swift
//  LeBaluchon
//
//  Created by Pierre on 09/07/2021.
//

import UIKit

class ConvertViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var resultConvertLabel: UILabel!
    @IBOutlet weak var textSegmentedLabel: UILabel!
    @IBOutlet weak var moneySegmented: UISegmentedControl!
    @IBOutlet weak var writenTextField: UITextField!
    
    //MARK: Variables
    var converter = Converter(startingCurrencies: .dollar, startedValue: 0.0)
    private let fixerService = FixerService()
    var exchangerate: Double = 0
    private var keyboardIsOpen = false
    var currentDateTime = Date()
    
    //MARK: Functions View
    override func viewDidLoad() {
        super.viewDidLoad()
        changeViewStyle()
        converter.startingCurrencies = .euros
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        getexchangeRates()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        resultConvertLabel.text = "€"
        updateView(textTopOfSegmented: textSegmentedLabel, resultLabel: resultConvertLabel)
    }
    
    //MARK: functions
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    func getexchangeRates() {
        fixerService.getExchangeRate { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let rate):
//                    print(rate)
                    self?.converter.rateEuroToDollar = rate.rates["USD"]!
                case .failure(let error):
                    print(error)
                }
            }
        }
        updateView(textTopOfSegmented: textSegmentedLabel, resultLabel: resultConvertLabel)
    }
    
    func updateView(textTopOfSegmented: UILabel, resultLabel: UILabel) {
        textTopOfSegmented.text = "Devise de départ -> \(converter.startingCurrenciesSymbole)"
        
        if converter.startingCurrencies == .dollar {
            resultLabel.text = "\(converter.result) \(converter.currencyOfTheResultSymbole) \n taux(\(converter.rateDollarToEuro))"
        } else {
            resultLabel.text = "\(converter.result) \(converter.currencyOfTheResultSymbole) \n taux(\(converter.rateEuroToDollar))"
        }
    }
    
    func changeViewStyle() {
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 3
    }
    
    func updateView() {
        textSegmentedLabel.text = "Devise de départ -> \(converter.startingCurrenciesSymbole)"
        
        if converter.startingCurrencies == .dollar {
            resultConvertLabel.text = "\(converter.result) \(converter.currencyOfTheResultSymbole) \n taux(\(converter.rateDollarToEuro))"
        } else {
            resultConvertLabel.text = "\(converter.result) \(converter.currencyOfTheResultSymbole) \n taux(\(converter.rateEuroToDollar))"
        }
    }
    
    //MARK: Actions
    @IBAction func segmentedPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            converter.startingCurrencies = .euros
            updateView(textTopOfSegmented: textSegmentedLabel, resultLabel: resultConvertLabel)

        case 1:
            converter.startingCurrencies = .dollar
            updateView(textTopOfSegmented: textSegmentedLabel, resultLabel: resultConvertLabel)
        default:
            return
        }
    }
    
    @IBAction func valueToConvertTextField(_ sender: UITextField) {
        let text = sender.text ?? ""
        let textInDouble = Double(text) ?? 0
        converter.startedValue = textInDouble
        updateView(textTopOfSegmented: textSegmentedLabel, resultLabel: resultConvertLabel)
        keyboardIsOpen = true
    }
    
}
