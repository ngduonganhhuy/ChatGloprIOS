//
//  AuthRepository.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import Foundation

protocol AuthRepository {
    @discardableResult
    func login(
        payload: LoginDTO,
        completion: @escaping (Result<ResponseLogin, Error>) -> Void
    ) -> Cancellable?

}
