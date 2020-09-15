//
//  PeopleTableViewController.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 24/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit
import CoreData

class PeopleViewController: UIViewController {
    @IBOutlet weak var peopleTextView: UITextView!
    @IBOutlet weak var peopleTextField: UITextField!

    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        displayPeople()
    }

    private func displayPeople() {
        var peopleText = ""
        for person in Person.all {
            if let name = person.name {
                peopleText += name + "\n"
            }
        }
        peopleTextView.text = peopleText
    }

}

extension PeopleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        addPerson()
        return true
    }

    private func addPerson() {
        guard let personName = peopleTextField.text,
            var people = peopleTextView.text else {
                return
        }

        people += personName + "\n"
        peopleTextView.text = people
        peopleTextField.text = ""

        savePerson(named: personName)
        
    }

    private func savePerson(named name: String) {
        // create entity instance with context
        let person = Person(context: AppDelegate.viewContext)
        // use
        person.name = name
        // save ocntext
        do { try AppDelegate.viewContext.save() }
        catch { print("name not saved")}
    }
}
