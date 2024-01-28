//
//  helpdeskapp_principalApp.swift
//  helpdeskapp-principal
//
//  Created by Arlid Henao Rueda on 27/01/24.
//

import SwiftUI

@main
struct helpdeskapp_principalApp: App {

    @State private var isShowingSplash = true
    private let loginService = LoginService()
    @ObservedObject private var loginViewModel: LoginViewModel

    init() {
        loginViewModel = LoginViewModel(loginService: loginService)
    }

    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashView()
            } else {
                LoginView(viewModel: loginViewModel)
            }
        }
    }
}
