//
//  SettingsService.swift
//  Cekikapeye
//
//  Created by Morgan on 12/11/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation

struct SettingsService {
    
    /// privée car j'en ai besoin que dans cette classe, ça évite des fautes de frappes.
    private struct Keys {
        static let currency = "currency"
    }

/// Propriété statique calculée :
/// standard est une propriété statique de UserDesfaults de type UserDefaults
/// ?? est l'opérateur par défaut. Il permet de déballer un optionnel en lui donnant une valeur par défaut. Si la fonction vaut nil la variable currency vaudra €
    
    static var currency: String {
        get {
            /// le getter nous permet de récupéré la currency
            return UserDefaults.standard.string(forKey: Keys.currency) ?? "€"
        }
        set {
            /// pour sauvegarder des données
            UserDefaults.standard.set(newValue, forKey: Keys.currency)
        }
    }
}
