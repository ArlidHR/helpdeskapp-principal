//
//  LoginService.swift
//  helpdeskapp-principal
//
//  Created by Arlid Henao Rueda on 27/01/24.
//

import Combine
import Foundation

class LoginService {
    func login(nickusuario: String, claveusuario: String, tokennotificacion: String, tipoapp: String) -> AnyPublisher<LoginModel, Error> {
        let url = URL(string: "https://mesadeayuda.metgroupsas.com/apiserver")!
        var request = URLRequest(url: url)
        request.setValue("", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"

        let body: [String: Any] = [
            "ws_login": [
                "clave": "Vh0v8qps2usP06Djun6Wg",
                "llave": "QCIRpVp96VoioN8JRxzTj",
                "usuario": "api_user"
            ],
            "metodo": "IniciarSesion",
            "data": [
                "nickusuario": "queretanomet",
                "claveusuario": "queretanomet",
                "tokennotificacion": tokennotificacion,
                "tipoapp": tipoapp
            ]
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            print("Error serializing JSON: \(error)")
            return Fail(error: error).eraseToAnyPublisher()
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return NetworkManager.shared.request(request: request) as AnyPublisher<LoginModel, Error>
    }
}

