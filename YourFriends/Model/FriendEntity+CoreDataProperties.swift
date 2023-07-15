//
//  FriendEntity+CoreDataProperties.swift
//  YourFriends
//
//  Created by Yuga Samuel on 13/07/23.
//
//

import Foundation
import CoreData


extension FriendEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendEntity> {
        return NSFetchRequest<FriendEntity>(entityName: "FriendEntity")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: UserEntity?
    
    var wrappedID: UUID {
        id ?? UUID()
    }
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
}

extension FriendEntity : Identifiable {
    
}
