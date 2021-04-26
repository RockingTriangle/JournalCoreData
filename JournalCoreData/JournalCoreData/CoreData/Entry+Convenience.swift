//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Mike Conner on 4/26/21.
//

import CoreData

extension Entry {
    
    @discardableResult convenience init(title: String, body: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context, uuid: String = UUID().uuidString) {
        self.init(context: context)
        self.title = title
        self.body = body
        self.timestamp = timestamp
        self.uuid = uuid
    }
    
}
