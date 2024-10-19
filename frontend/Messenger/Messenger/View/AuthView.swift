//
//  AuthView.swift
//  Messenger
//
//  Created by Александр Галайда on 12.03.2024.
//

import SwiftUI
import Apollo
import MessengerAPI

struct AuthView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var userId: Int?
    @State private var userName: String?
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Логин", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Пароль", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Войти") {
                    Login()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Ошибка"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
            }
            .padding()
            .navigationBarTitle("Авторизация")
            .background(
                NavigationLink(destination: ContactsView(userId: userId ?? 0, userName: userName ?? "none"), isActive: $isActive) {
                    EmptyView()
                }
            )
        }
    }

    private func Login() {
        Network.shared.apollo.perform(mutation: AuthMutation(username: self.username, password: self.password)) 
        {
            result in switch result
            {
                case .success(let result):
                    if let id = result.data?.authorize?.id 
                    {
                        DispatchQueue.main.async {
                            self.userId = id
                            self.userName = result.data?.authorize?.username
                            isActive = true
                        }
                    } 
                    else
                    {
                        self.alertMessage = "Некорректные данные."
                        self.showAlert = true
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

#Preview {
    AuthView()
}
