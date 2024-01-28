//
//  SplashView.swift
//  helpdeskapp-principal
//
//  Created by Arlid Henao Rueda on 27/01/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @Environment(\.colorScheme) var colorScheme
    private let loginService = LoginService()
    @ObservedObject private var loginViewModel: LoginViewModel

    init() {
        loginViewModel = LoginViewModel(loginService: loginService)
    }
    
    var body: some View {
        ZStack {
            if isActive {
                LoginView(viewModel: loginViewModel)
            } else {
                if colorScheme == .dark {
                    Image("SplashScreenImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } else {
                    Image("SplashScreenImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}

