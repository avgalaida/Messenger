//
//  RegView.swift
//  Messenger
//
//  Created by Александр Галайда on 09.03.2024.
//

import Foundation
import SwiftUI
import MessengerAPI

struct RegView: View {
    @State private var username = ""
    @State private var password = ""
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

                Button("Зарегистрироваться") {
                    Login()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Сообщение"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
            .navigationBarTitle("Регистрация")
        }
    }

    private func Login() {
        Network.shared.apollo.perform(mutation: RegMutation(username: self.username, password: self.password))
        {
            result in switch result
            {
                case .success(let result):
                if let id = result.data?.createUser?.id
                    {
                        self.alertMessage = "Вы успешно зарегистрировались."
                        self.showAlert = true
                    }
                    else
                    {
                        self.alertMessage = "Пользователь с таким именем уже зарегистрирован."
                        self.showAlert = true
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

#Preview {
    RegView()
}
