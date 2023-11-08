//
//  CookieUtil.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 05/11/2023.
//

import Foundation

// MARK: Cookie

struct CookieUtil {
    static func verify(for url: URL, isEx: Bool) -> Bool {
        guard let cookies = HTTPCookieStorage.shared.cookies(for: url), !cookies.isEmpty else { return false }

        var igneous, memberID, passHash: String?
        cookies.forEach { cookie in
            if #available(iOS 15, *) {
                guard let expiresDate = cookie.expiresDate, expiresDate > .now, !cookie.value.isEmpty else { return }
            } else {
                guard let expiresDate = cookie.expiresDate, expiresDate > Date(), !cookie.value.isEmpty else { return }
            }
            if cookie.name == Defaults.Cookie.igneous && cookie.value != Defaults.Cookie.mystery {
                igneous = cookie.value
            }
            if cookie.name == Defaults.Cookie.ipbMemberId {
                memberID = cookie.value
            }
            if cookie.name == Defaults.Cookie.ipbPassHash {
                passHash = cookie.value
            }
        }

        return (!isEx || igneous != nil) && memberID != nil && passHash != nil
    }
}
