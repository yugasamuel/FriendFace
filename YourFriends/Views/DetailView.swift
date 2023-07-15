//
//  DetailView.swift
//  YourFriends
//
//  Created by Yuga Samuel on 11/07/23.
//

import SwiftUI

struct DetailView: View {
    
    let user: UserEntity
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(user.wrappedName)
                    .font(.title3)
                    .fontWeight(.bold)
                Image(systemName: "circle.fill")
                    .font(.caption2)
                    .foregroundColor(user.isActive ? .green : .gray)
            }
            .padding(.bottom)
            
            VStack(spacing: 8) {
                Text("Age: \(user.age)")
                    .font(.body)
                Text("Company: \(user.wrappedCompany)")
                    .font(.body)
                Text("Registered: \(user.formattedDate)")
                    .font(.body)
            }
            .padding(.bottom)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width-80,
                       height: 0.5)
            
            VStack(spacing: 8) {
                Text("Friends: ")
                    .font(.headline)
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let dataController = DataController()
    static let newUser = UserEntity(context: dataController.context)
    
    static var previews: some View {
        DetailView(user: newUser)
    }
}
