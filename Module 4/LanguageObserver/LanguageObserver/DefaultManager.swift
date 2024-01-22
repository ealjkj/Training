//
//  DefaultManager.swift
//  LanguageObserver
//
//  Created by intekglobal02 on 1/22/24.
//

import Foundation

class DefaultManager {
    static let LanguageKey = "LanguageKey"
    
    static func setLanguage(to language: String) {
        UserDefaults.standard.setValue(language, forKey: LanguageKey)
    }
    
    static func getSelectedLanguage() -> String? {
        if let language = UserDefaults.standard.string(forKey: LanguageKey) {
            return language
        }
        return nil
    }
    
    static func removeSelectedLanguage() {
        UserDefaults.standard.removeObject(forKey: self.LanguageKey)
        UserDefaults.standard.synchronize()
    }
}
