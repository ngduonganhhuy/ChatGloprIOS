//
//  LoginDTO.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import Foundation

final class LoginDTO {
    let username: String?
    let password: String?

    init(username: String?, password: String?) {
        self.username = username
        self.password = password
    }

    func toRequest() -> [String: Any] {
        return [
            "identity": username ?? "",
            "password": password ?? ""
        ]
    }
}
