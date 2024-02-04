//
//  LoginView.swift
//  helpdeskapp-principal
//
//  Created by Arlid Henao Rueda on 27/01/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack () {
            Image(LoginStrings.backgraundImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                ImageLoginView()
                TextFieldLoginView(viewModel: viewModel)
                Spacer()
            }
        }
    }
}

struct ImageLoginView: View {
    var body: some View {
        Image(LoginStrings.loginImage)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
}

struct TextFieldLoginView: View {
    @State private var emailTextField = GeneralStrings.emptyString
    @State private var passwordTextField = GeneralStrings.emptyString
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                if emailTextField.isEmpty {
                    Text(LoginStrings.emailText)
                    .foregroundColor(.white)
                    .font(.custom("Nunito-Bold", size: 17))
                }
                TextField("", text: $emailTextField)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))

            ZStack(alignment: .leading) {
                if passwordTextField.isEmpty {
                    Text("* Contraseña")
                    .foregroundColor(.white)
                    
                }
                TextField("", text: $passwordTextField)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
            
            .padding(.bottom, 40)
            
            Button(action: {
                viewModel.login()
            }) {
                HStack {
                    Spacer()
                    Text(viewModel.user != nil ? "Logged in as \(viewModel.user!.messageCode)" : (viewModel.error != nil ? "Error: \(viewModel.error!.localizedDescription)" : "Continuar"))
                    .font(.custom("Nunito-Bold", size: 17))
                    Spacer()
                }
                .padding()
                .background(Color(red: 214/255, green: 215/255, blue: 215/255))
                .foregroundColor(.white)
                .cornerRadius(20)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(loginService: LoginService()))
}
