//
//  AppDelegate.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import ComposableArchitecture
import UIKit

struct AppDelegateReducer: Reducer {
    struct State: Equatable {}

    indirect enum Action: Equatable {
        case onLaunchFinish
    }

    func reduce(into _: inout State, action: Action) -> Effect<Action> {
        switch action {
            case .onLaunchFinish:
                return .none
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    let store = Store(initialState: .init()) { AppReducer() }

    lazy var viewStore = ViewStore(store) { _ in AppReducer.State() }

    let appDIContainer = AppDIContainer()
    var appFlowCoordinator: AppFlowCoordinator?
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        AppAppearance.setupAppearance()

        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()

        window?.rootViewController = navigationController
        appFlowCoordinator = AppFlowCoordinator(
            navigationController: navigationController,
            appDIContainer: appDIContainer
        )
        appFlowCoordinator?.start()
        window?.makeKeyAndVisible()

        if !AppUtil.isTesting {
            viewStore.send(.appDelegate(.onLaunchFinish))
        }

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
//        CoreDataStorage.shared.saveContext()
    }
}
