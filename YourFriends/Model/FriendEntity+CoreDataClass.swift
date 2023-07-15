//
//  FriendEntity+CoreDataClass.swift
//  YourFriends
//
//  Created by Yuga Samuel on 13/07/23.
//
//

import Foundation
import CoreData

@objc(FriendEntity)
public class FriendEntity: NSManagedObject, Codable {
    
    enum CodingKeys: CodingKey {
        case id, name
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
