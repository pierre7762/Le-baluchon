//
//  Translate.swift
//  LeBaluchon
//
//  Created by Pierre on 27/08/2021.
//

import Foundation

struct Translater {
    var sourceLanguage: LanguageList
    var sourcetext: String = ""
    var targetLanguage: LanguageList {
        if sourceLanguage == .en {
            return .fr
        }
        return .en
    }
    var targetLanguageString: String {
//        var targetLanguageStr: String
        if targetLanguage == .en {
            return "en"
        }
        return "fr"
//        return targetLanguageStr
    }
    var translatedText: String = ""
    
    enum LanguageList {
        case fr, en
    }
    
}
