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
        
        // 1. create entity instance with context :
        /// Lorsqu'on a installé Core Data on a récupéré un contexte de persistentContainer via la propriété viewContext. On en avait fait une propriété statique de façon à pouvoir récupérer notre contexte en écrivant simplement AppDelegate.viewContext
        /// J'ai un objet Person ajouté à mon contexte
        let person = Person(context: AppDelegate.viewContext)
        
        // 2. use :
        /// Je peux donner une valeur à mon attribut name
        person.name = name
        
        // 3. save context :
        /// Pour que les changements (ajouts/suppressions/modifications d'objet) soient inscrits dans notre BDD il faut savegarder notre contexte avec la méthode save.
        /// cette méthode save( ) peut renvoyer une erreur donc il faut l'utiliser avec un try et utiliser un do/catch pour gérer les erreurs et afficher une alerte si la sauvegarder échoue.
        do { try AppDelegate.viewContext.save() }
        catch { print("name not saved")}
    }
}
