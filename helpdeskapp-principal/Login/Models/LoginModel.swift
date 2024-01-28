//
//  LoginModel.swift
//  helpdeskapp-principal
//
//  Created by Arlid Henao Rueda on 27/01/24.
//

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let idMensaje, mensaje, messageCode, messageType: String
    let data: DataClass?

    enum CodingKeys: String, CodingKey {
        case idMensaje = "idmensaje"
        case mensaje = "mensaje"
        case messageCode = "codigomensaje"
        case messageType = "tipomensaje"
        case data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let sessionUserId, tokenSession: String

    enum CodingKeys: String, CodingKey {
        case sessionUserId = "idusuariosesion"
        case tokenSession = "tokensesion"
    }
}
