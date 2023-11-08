//
//  ApiSuffix.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import Foundation

final class ApiSuffix {
    static let shared = ApiSuffix()
    private init() {}

    let API_KEY = ""

    // MARK: - BASE

    let BASE_URL: String = "https://chat-glopr-dev.up.railway.app/api"
    let BASE_URL_SOCKET: String = "https://chat-glopr-dev.up.railway.app/"

    // MARK: - AUTH

    let LOGIN: String = "/auth/login"
    let REGISTER: String = "/auth/register"
    let REFRESH_TOKEN: String = "/auth/token/refresh"
    let SEND_CODE = "/users/request-send-otp"

    // MARK: - CONVERSATION

    let LIST_CONVERSATION: String = "/conversation"
    let CONVERSATION_DETAIL: String = "/conversation"

    // MARK: - MESSAGE

    let SEND_MESSAGE: String = "/message/text"

    // MARK: - USER

    let UPDATE_USER_INFO: String = "/users/me"
}
