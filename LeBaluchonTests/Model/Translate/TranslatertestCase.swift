//
//  TranslatertestCase.swift
//  LeBaluchonTests
//
//  Created by Pierre on 03/09/2021.
//

import XCTest
import UIKit
@testable import LeBaluchon

class TranslaterTestCase: XCTestCase {
    
    var translate: Translater!
    
    override func setUp() {
        super.setUp()
        translate = Translater(sourceLanguage: .en)
    }
    
    func testGivenAppStart_WhenSourceLanguageIsEnglish_ThenReturnFrench() {
        XCTAssertEqual(translate.targetLanguage, .fr)
        XCTAssertEqual(translate.targetLanguageString, "fr")
    }
    
    func testGivenAppStart_WhenSourceLanguageIsFrench_ThenReturnEnglish() {
        translate.sourceLanguage = .fr
        XCTAssertEqual(translate.targetLanguage, .en)
        XCTAssertEqual(translate.targetLanguageString, "en")

    }


}
