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
        translate = Translater(targetLanguage: .en)
    }
    
    func testGivenAppStart_WhenTargetLanguageIsEnglish_ThenReturnEN() {
        XCTAssertEqual(translate.targetLanguageString, "en")
    }
    
    func testGivenAppStart_WhenTargetLanguageIsFrench_ThenReturnFR() {
        translate.targetLanguage = .fr
        XCTAssertEqual(translate.targetLanguageString, "fr")

    }
    


}
