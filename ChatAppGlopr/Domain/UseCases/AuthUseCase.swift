//
//  AuthUseCase.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import Foundation

final class AuthUseCase: AuthRepository {

    private let repository: AuthRepository
    private let dataTransferService: DataTransferService
    private let backgroundQueue: DataTransferDispatchQueue

    init(repository: AuthRepository, dataTransferService: DataTransferService, backgroundQueue: DataTransferDispatchQueue) {
        self.repository = repository
        self.dataTransferService = dataTransferService
        self.backgroundQueue = backgroundQueue
    }

    func login(payload: LoginDTO, completion: @escaping (Result<ResponseLogin, Error>) -> Void) -> Cancellable? {
        repository.login(payload: payload, completion: completion)
        return nil
    }
}
