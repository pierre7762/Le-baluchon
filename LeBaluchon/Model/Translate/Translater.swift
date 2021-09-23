//
//  Translate.swift
//  LeBaluchon
//
//  Created by Pierre on 27/08/2021.
//

import Foundation

struct Translater {
    var sourcetext: String = ""
    var targetLanguage: LanguageList
    var targetLanguageString: String {
        if targetLanguage == .en {
            return "en"
        }
        return "fr"
    }
    var translatedText: String = ""
    
    enum LanguageList {
        case fr, en
    }
    
}
