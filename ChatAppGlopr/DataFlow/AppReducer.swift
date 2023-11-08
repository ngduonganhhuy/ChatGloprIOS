import ComposableArchitecture

struct AppReducer: Reducer {
    struct State: Equatable {
        var appDelegateState = AppDelegateReducer.State()
    }

    enum Action: Equatable {
        case appDelegate(AppDelegateReducer.Action)
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
            case .appDelegate:
                return .none
        }
    }
}
