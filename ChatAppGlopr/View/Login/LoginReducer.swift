//
//  LoginReducer.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 04/11/2023.
//

import ComposableArchitecture

struct LoginReducer: Reducer {
    struct State: Equatable {
    }

    indirect enum Action: Equatable {}

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {}
        }
    }
}
