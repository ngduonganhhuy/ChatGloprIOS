//
//  AppDIContainer.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import Foundation

final class AppDIContainer {
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(
            baseURL: URL(string: ApiSuffix.shared.BASE_URL)!,
            queryParameters: [
                "api_key": ApiSuffix.shared.API_KEY,
                "language": NSLocale.preferredLanguages.first ?? "en"
            ]
        )

        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
}
