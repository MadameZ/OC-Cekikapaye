//
//  SettingsViewController.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 24/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currency = SettingsService.currency
        currencyLabel.text = currency
    }

    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func changeCurrency(_ sender: UIButton) {
        guard let currency = sender.titleLabel?.text else { return }
        
        /// on récupère la valeur de UserDefaults pour l'afficher dans le label
        currencyLabel.text = currency

        /// on enregistre le titre du label dans les userDefaults
        SettingsService.currency = currency
    }
}
