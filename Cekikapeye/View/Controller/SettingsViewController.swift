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

    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func changeCurrency(_ sender: UIButton) {
        guard let currency = sender.titleLabel?.text else { return }
        currencyLabel.text = currency

        SettingsService.currency = currency
    }
}
