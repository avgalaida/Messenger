//
//  MainView.swift
//  Messenger
//
//  Created by Александр Галайда on 09.03.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: RegView()) {
                    Text("Регистрация")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: AuthView()) {
                    Text("Авторизация")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("Мессенджер")
        }
    }
}

#Preview {
    MainView()
}
