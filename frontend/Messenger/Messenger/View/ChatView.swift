//
//  ChatView.swift
//  Messenger
//
//  Created by Александр Галайда on 12.03.2024.
//

import SwiftUI
import Apollo
import MessengerAPI

struct ChatView: View {
    var userId: Int
    var toUserId: Int
    var toUserName: String
    @State private var messages: [ChatQuery.Data.Chat] = []
    @State private var newMessageText: String = ""
    @State private var sub: Cancellable?

    var body: some View {
        VStack {
            Text("Чат с пользователем \(toUserName)")

            List(messages, id: \.id) { message in
                HStack {
                    if message.senderid == userId {
                        Spacer()
                        Text("\(message.text ?? "")")
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    } else {
                        Text("\(message.text ?? "")")
                            .padding(8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Spacer()
                    }
                }
            }

            HStack {
                TextField("Новое сообщение", text: $newMessageText)
                    .padding()

                Button("Отправить") {
                    sendMessage()
                    newMessageText = ""
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
        .onAppear {
            fetchMessages()
            startSendSubscription()
        }
    }

    private func sendMessage() {
        Network.shared.apollo.perform(mutation: SendMutation(from: userId, to: toUserId, text: newMessageText)) 
        {
            result in switch result
            {
                case .success(_): fetchMessages()
                case .failure(let error): print(error)
            }
        }
    }

    private func fetchMessages() {
        Network.shared.apollo.fetch(query: ChatQuery(a: userId, b: toUserId), cachePolicy: .fetchIgnoringCacheData) {
                result in switch result
                {
                    case .success(let graphQLResult):
                        if let messages = graphQLResult.data?.chat {
                            self.messages = messages
                        }
                    case .failure(let error): print(error)
                }
            }
    }
    
    func startSendSubscription() {
        Network.shared.apollo.subscribe(subscription: SubMessageSubscription())
        {
            result in switch result
            {
                case .success(_): fetchMessages()
                case .failure(let error): print(error)
            }
        }
    }
}

//#Preview {
//    ChatView(userId: 0, toUserId: 10, toUserName: "none")
//}
