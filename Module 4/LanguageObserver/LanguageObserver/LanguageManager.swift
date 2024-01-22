//
//  LanguageManager.swift
//  LanguageObserver
//
//  Created by intekglobal02 on 1/22/24.
//

import Foundation

protocol LanguageObserver : AnyObject {
    func languageDidChange(language: String)
}

class LanguageManager {
    static let shared = LanguageManager()
    
    private let languageKey = "selectedLanguage"
    
    var selectedLanguage: String  {
        get {
            let language = DefaultManager.getSelectedLanguage() ?? "en"
            return language
        }
        
        set {
            DefaultManager.setLanguage(to: newValue)
            notifyObservers()
        }
    }
    
    var observers =  NSHashTable<AnyObject>.weakObjects()
    
    func attach(_ newObserver: LanguageObserver) {
        observers.add(newObserver)
    }
    
    func notifyObservers() {
        observers.allObjects.compactMap { $0 as? LanguageObserver}.forEach {
            $0.languageDidChange(language: selectedLanguage)
        }
    }
}
