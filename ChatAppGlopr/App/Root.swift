//
//  ContentView.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import ComposableArchitecture
import SwiftUI

struct RootView: View {
    var body: some View {
        LoginView(store: .init(initialState: .init()) {
            LoginReducer()
        })
    }
}

#Preview {
    RootView()
}
