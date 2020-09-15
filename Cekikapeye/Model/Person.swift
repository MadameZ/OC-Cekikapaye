//
//  Person.swift
//  Cekikapeye
//
//  Created by Morgan on 13/11/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {
    static var all: [Person] {
        // create request
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        // execute request, ie get the saved data
        guard let persons = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return persons
    }
}
