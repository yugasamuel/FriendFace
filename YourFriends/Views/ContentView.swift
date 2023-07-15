//
//  ContentView.swift
//  YourFriends
//
//  Created by Yuga Samuel on 09/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(modelData.users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            Text(user.wrappedName)
                                .font(.headline)
                            Image(systemName: "circle.fill")
                                .font(.caption2)
                                .foregroundColor(user.isActive ? .green : .gray)
                        }
                    }
                }
            }
            .navigationDestination(for: UserEntity
                .self) { user in
                DetailView(user: user)
            }
            .navigationTitle("FriendFace")
            .task {
                if modelData.users.isEmpty {
                    await modelData.loadData()
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
