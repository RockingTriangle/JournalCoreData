//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Mike Conner on 4/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.fetchEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        cell.textLabel?.text = EntryController.shared.entries[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            EntryController.shared.delete(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditDetailVC" {
            guard let destinationVC = segue.destination as? EntryDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else { return }
            let entry = EntryController.shared.entries[indexPath.row]
            destinationVC.entry = entry
        }
    }
    
} //End of class
