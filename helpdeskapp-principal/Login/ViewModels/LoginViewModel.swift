//
//  LoginViewModel.swift
//  helpdeskapp-principal
//
//  Created by Arlid Henao Rueda on 27/01/24.
//

import Combine

enum LoginStatus {
    case idle
    case loading
    case success(LoginModel)
    case failure(Error)
}

class LoginViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let loginService: LoginService
    
    @Published var status: LoginStatus = .idle
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var user: LoginModel?
    @Published var error: Error?

    init(loginService: LoginService) {
        self.loginService = loginService
    }

    func login() {
        status = .loading
        loginService.login(nickusuario: username, claveusuario: password, tokennotificacion: "None", tipoapp: "IOS").sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                self.status = .failure(error)
            case .finished:
                break
            }
        }, receiveValue: { user in
            self.status = .success(user)
        })
        .store(in: &cancellables)
    }
}

