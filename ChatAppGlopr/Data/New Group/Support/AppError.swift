//
//  AppError.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 02/11/2023.
//

import Foundation

enum AppError: Error, Identifiable, Equatable, Hashable {
    var id: String { localizedDescription }

    case databaseCorrupted(String?)
    case copyrightClaim(String)
    case ipBanned(BanInterval)
    case expunged(String)
    case networkingFailed
    case webImageFailed
    case parseFailed
    case noUpdates
    case notFound
    case unknown
}

extension AppError {
    var isRetryable: Bool {
        switch self {
        case .databaseCorrupted, .ipBanned, .networkingFailed, .parseFailed,
                .noUpdates, .notFound, .unknown, .webImageFailed:
            return true
        case .copyrightClaim, .expunged:
            return false
        }
    }
    var localizedDescription: String {
        switch self {
        case .databaseCorrupted:
            return "Database Corrupted"
        case .copyrightClaim:
            return "Copyright Claim"
        case .ipBanned:
            return "IP Banned"
        case .expunged:
            return "Gallery Expunged"
        case .networkingFailed:
            return "Network Error"
        case .webImageFailed:
            return "Web image loading error"
        case .parseFailed:
            return "Parse Error"
        case .noUpdates:
            return "No updates available"
        case .notFound:
            return "Not found"
        case .unknown:
            return "Unknown Error"
        }
    }

}

enum BanInterval: Equatable, Hashable {
    case days(_: Int, hours: Int?)
    case hours(_: Int, minutes: Int?)
    case minutes(_: Int, seconds: Int?)
    case unrecognized(content: String)
}

extension BanInterval {

}
