//
//  AppUtil.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 05/11/2023.
//

import Foundation

struct AppUtil {
    static var version: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "null"
    }

    static var build: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "null"
    }

    private static let internalIsTesting = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    public static var isTesting: Bool {
        #if DEBUG
        internalIsTesting
        #else
        false
        #endif
    }

    static func dispatchMainSync(execute work: () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.sync(execute: work)
        }
    }
}
