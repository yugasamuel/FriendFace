//
//  UserEntity+CoreDataProperties.swift
//  YourFriends
//
//  Created by Yuga Samuel on 13/07/23.
//
//

import Foundation
import CoreData


extension UserEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    
    var wrappedID: UUID {
        id ?? UUID()
    }
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedCompany: String {
        company ?? "Unknown"
    }
    
    var formattedDate: String {
        guard let registeredDate = registered else {
            return "Unknown"
        }
        return registeredDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    var friendsArray: [FriendEntity] {
        let set = friends as? Set<FriendEntity> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

// MARK: Generated accessors for friends
extension UserEntity {
    
    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: FriendEntity)
    
    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: FriendEntity)
    
    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)
    
    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)
    
}

extension UserEntity : Identifiable {
    
}
