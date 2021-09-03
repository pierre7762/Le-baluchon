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
        var targetLang: LanguageList
        if sourceLanguage == .en {
            targetLang = .fr
        } else {
            targetLang = .en
        }
        return targetLang
    }
    var targetLanguageString: String {
        var targetLanguageStr: String
        if targetLanguage == .en {
            targetLanguageStr = "en"
        } else {
            targetLanguageStr = "fr"
        }
        return targetLanguageStr
    }
    var translatedText: String = ""
    
    enum LanguageList {
        case fr, en
    }
    
}
