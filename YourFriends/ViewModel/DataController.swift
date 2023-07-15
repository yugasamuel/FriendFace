//
//  DataController.swift
//  YourFriends
//
//  Created by Yuga Samuel on 13/07/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let instance = DataController()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "FriendFace")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        context = container.viewContext
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving. \(error.localizedDescription)")
        }
    }
}

