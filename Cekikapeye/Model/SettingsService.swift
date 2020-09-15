//
//  SettingsService.swift
//  Cekikapeye
//
//  Created by Morgan on 12/11/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation

struct SettingsService {
    private struct Keys {
        static let currency = "currency"
    }

    static var currency: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.currency) ?? "€"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.currency)
        }
    }
}
