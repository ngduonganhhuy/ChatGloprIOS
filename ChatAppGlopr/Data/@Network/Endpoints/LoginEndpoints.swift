//
//  LoginEndpoint.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 24/10/2023.
//

import Foundation

struct LoginEndpoints {
    static func login(with request: LoginDTO) -> Endpoint<LoginDTO> {
        return Endpoint(path: ApiSuffix.shared.LOGIN, method: .post, bodyParameters: request.toRequest())
    }
}
