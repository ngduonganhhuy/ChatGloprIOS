//
//  LoginView.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 04/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct LoginView: View {
    private let store: StoreOf<LoginReducer>
    @ObservedObject private var viewStore: ViewStoreOf<LoginReducer>

    init(store: StoreOf<LoginReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }

    var body: some View {
        WithViewStore(store, observe: { $0 }, content: { _ in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        })
    }
}

#Preview {
    LoginView(store: Store(initialState: LoginReducer.State()) {
        LoginReducer()
    })
}
