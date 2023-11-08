//
//  LoadingState.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 02/11/2023.
//

import Foundation

enum LoadingState: Equatable {
    static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        lhs == rhs
    }

    case idle
    case loading
    case failed(AppError)
}
