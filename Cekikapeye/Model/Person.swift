//
//  Person.swift
//  Cekikapeye
//
//  Created by Morgan on 13/11/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//



import Foundation
import CoreData

/// Class crée avec le fichier xcdatamodeld. Pas besoin de lui donner les propriétés car elles ont été crées dans le fichier xcdatamodeld.

class Person: NSManagedObject {
    
    static var all: [Person] {
        // On récupère nos objets dans la BDD
        // create request :
        /// NSFetchRequest est la classe qui permet au contexte de récupérer des objets à la base de données.
        /// cette instance est dédiée à la récupération d'objets Person
        /// cette méthode fetch Request est générée automatiquement par CoreData dans l'extension Person lors de la création de l'attribut Person
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        
        /// N.B NSFetchRequest<Person> est une classe générique
        
        // execute request, ie get the saved data :
        /// On utilise la méthode fetch de NSManagedObjectContext qui renvoie un tableau de Person. Cette méthode peut renvoyer une erreur donc on utilise try ? et on déballe l'optionnel créé avec un guard let
        guard let persons = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return persons
    }
}


