//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Mike Conner on 4/26/21.
//

import CoreData

class EntryController {
    
    //MARK: - Properties
    static let shared = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
       let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - Functions
    func createEntry(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        self.entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.entries = entries
    }
    
    func delete(entry: Entry) {
        guard let index = self.entries.firstIndex(of: entry) else { return }
        self.entries.remove(at: index)
        CoreDataStack.saveContext()
    }
    
} //End of class
