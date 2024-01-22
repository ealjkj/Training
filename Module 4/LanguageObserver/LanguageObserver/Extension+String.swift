//
//  Extension+String.swift
//  LanguageObserver
//
//  Created by intekglobal02 on 1/22/24.
//

import Foundation

extension String {
    func localized() -> String {
        let selectedLanguage = DefaultManager.getSelectedLanguage() ?? "en"
        let path = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value: self, comment: self)
    }
}
