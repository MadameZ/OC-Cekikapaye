//
//  ListViewController.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 21/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var spendings = Spending.all

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        spendings = Spending.all
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return spendings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpendingCell", for: indexPath)

        let spending = spendings[indexPath.section][indexPath.row]
        cell.textLabel?.text = spending.content
        cell.detailTextLabel?.text = "\(spending.amount) \(SettingsService.currency)"

        return cell
    }
    /// Modifier le nom de la section.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // get the person's name
        guard let person = spendings[section].first?.person, let name = person.name else {
            return nil
        }

        // get spendings amount
        var totalAmount = 0.0
        for spending in spendings[section] {
            totalAmount += spending.amount
        }

        // return name, amount and currency
        return name + " (\(totalAmount) \(SettingsService.currency))"
    }

}
// delete cells
extension ListViewController {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // delete core data object
            AppDelegate.viewContext.delete(spendings[indexPath.section][indexPath.row])
            try! AppDelegate.viewContext.save()

            // delete the corresponding spendings value
            spendings[indexPath.section].remove(at: indexPath.row)

            // delete cell
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
