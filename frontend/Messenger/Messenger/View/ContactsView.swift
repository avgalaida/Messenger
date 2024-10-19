//
//  ContactsView.swift
//  Messenger
//
//  Created by Александр Галайда on 12.03.2024.
//

import SwiftUI
import Apollo
import MessengerAPI

struct ContactsView: View {
    var userId: Int
    var userName: String
    
    @State private var users: [ContactsQuery.Data.User] = []
    @State private var selectedUserId: Int?
    @State private var selectedUserName: String?
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(users, id: \.id) { user in
                    NavigationLink(destination: ChatView(userId: userId, toUserId: user.id, toUserName: user.username ?? "")) {
                        Text(user.username ?? "")
                    }
                }
                .onAppear {
                    fetchContacts()
                    startRegSubscription()
                }
            }
            .navigationTitle("Контакты \(userName)")
        }
    }
    
    func fetchContacts() {
        Network.shared.apollo.fetch(query: ContactsQuery(), cachePolicy: .fetchIgnoringCacheData)
        { 
            result in switch result
            {
                case .success(let graphQLResult):
                    if let users = graphQLResult.data?.users {
                        self.users = users
                    }
                case .failure(let error): print(error)
            }
        }
    }
    
    func startRegSubscription() {
        Network.shared.apollo.subscribe(subscription: SubContactsSubscription())
        {  
            result in switch result
            {
                case .success(_): fetchContacts()
                case .failure(let error): print(error)
            }
        }
    }
}

//#Preview {
//    ContactsView(userId: 0, userName: "qwe")
//}
