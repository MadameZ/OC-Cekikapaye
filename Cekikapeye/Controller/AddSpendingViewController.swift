//
//  AddSpendingViewController.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 21/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class AddSpendingViewController: UIViewController {

    var persons = Person.all

    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var personPickerView: UIPickerView!

    @IBAction func save() {
        guard let content = contentTextField.text,
            let amountText = amountTextField.text,
            let amount = Double(amountText) else {
                return
        }

        // create entity in a context
        let spending = Spending(context: AppDelegate.viewContext)
        // give values to its properties
        spending.content = content
        spending.amount = amount
        // use relationship attribute to get a value
        spending.person = getPerson()
        // save context
        try? AppDelegate.viewContext.save()

        navigationController?.popViewController(animated: true)
    }

    private func getPerson() -> Person? {
        if persons.count > 0 {
            let index = personPickerView.selectedRow(inComponent: 0)
            return persons[index]
        } else {
            return nil
        }
    }
}

extension AddSpendingViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return persons.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return persons[row].name
    }
}

extension AddSpendingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        contentTextField.resignFirstResponder()
        amountTextField.resignFirstResponder()
    }
}
