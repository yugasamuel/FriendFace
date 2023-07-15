//
//  UserEntity+CoreDataClass.swift
//  YourFriends
//
//  Created by Yuga Samuel on 13/07/23.
//
//

import Foundation
import CoreData


@objc(UserEntity)
public class UserEntity: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case id, name, age, company, isActive, registered, friends
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int16.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.registered = try container.decode(Date.self, forKey: .registered)
        self.friends = try container.decode(Set<FriendEntity>.self, forKey: .friends) as NSSet
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(isActive, forKey: .isActive)
        try container.encode(registered, forKey: .registered)
        try container.encode(friends as! Set<FriendEntity>, forKey: .friends)
      }
}

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

enum DecoderConfigurationError: Error {
    case missingManagedObjectContext
}


