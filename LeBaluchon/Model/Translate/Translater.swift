//
//  Translate.swift
//  LeBaluchon
//
//  Created by Pierre on 27/08/2021.
//

import Foundation
import UIKit

struct Translater {
    var sourceLanguage: LanguageList
    var sourcetext: String = ""
    var targetLanguage: LanguageList {
        if sourceLanguage == .en {
            return .fr
        } else {
            return .en
        }
    }
    var targetLanguageString: String {
        if targetLanguage == .en {
            return "en"
        } else {
            return "fr"
        }
    }
    var translatedText: String = ""
    
    enum LanguageList {
        case fr, en
    }
    
}
