//
//  YourFriendsApp.swift
//  YourFriends
//
//  Created by Yuga Samuel on 09/07/23.
//

import SwiftUI

@main
struct YourFriendsApp: App {
    
    @StateObject var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
