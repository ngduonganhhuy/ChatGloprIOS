import SwiftUI
import SwiftUINavigation

extension NavigationLink {
    init<S: StringProtocol, Value, WrappedDestination>(
        _ title: S,
        unwrapping value: Binding<Value?>,
        @ViewBuilder destination: @escaping (Binding<Value>) -> WrappedDestination
    ) where Destination == WrappedDestination?, Label == Text {
        self.init(
            title,
            destination: Binding(unwrapping: value).map(destination),
            isActive: value.isPresent()
        )
    }

    init<Enum, Case, WrappedDestination>(
        unwrapping enum: Binding<Enum?>,
        case casePath: CasePath<Enum, Case>,
        @ViewBuilder destination: @escaping (Binding<Case>) -> WrappedDestination
    ) where Destination == WrappedDestination?, Label == Text {
        self.init(
            "", unwrapping: `enum`.case(casePath),
            destination: destination
        )
    }
}

extension View {
    @MainActor
    @ViewBuilder
    func sheet<Enum, Case, Content>(
        unwrapping enum: Binding<Enum?>,
        case casePath: CasePath<Enum, Case>,
        onDismiss: (() -> Void)? = nil,
        isEnabled: Bool,
        @ViewBuilder content: @escaping (Binding<Case>) -> Content
    ) -> some View
        where Content: View {
        if isEnabled {
            self.sheet(unwrapping: `enum`, case: casePath, onDismiss: onDismiss, content: content)
        } else {
            self
        }
    }

    @discardableResult
    func confirmationDialog<Enum, Case, A: View>(
        message: String,
        unwrapping enum: Binding<Enum?>,
        case casePath: CasePath<Enum, Case>,
        @ViewBuilder actions: @escaping (Case) -> A
    ) -> some View {
        if #available(iOS 15, *) {
            return self.confirmationDialog(
                title: { _ in Text("") },
                titleVisibility: .hidden,
                unwrapping: `enum`.case(casePath),
                actions: actions,
                message: { _ in Text(message) }
            )
        } else {
            return self.alert(isPresented: Binding<Bool>(
                get: { `enum`.wrappedValue != nil },
                set: { if !$0 { `enum`.wrappedValue = nil } }
            ), content: {
                Alert(
                    title: Text(""),
                    message: Text(message),
                    primaryButton: .default(Text("Confirm"), action: {
                        if let unwrappedEnum = `enum`.wrappedValue,
                           let caseValue = casePath.extract(from: unwrappedEnum) {
                            _ = actions(caseValue)
                        }
                    }),
                    secondaryButton: .cancel {
                        `enum`.wrappedValue = nil
                    }
                )
            })
        }
    }

    func confirmationDialog<Enum, Case: Equatable, A: View>(
        message: String,
        unwrapping enum: Binding<Enum?>,
        case casePath: CasePath<Enum, Case>,
        matching case: Case,
        @ViewBuilder actions: @escaping (Case) -> A
    ) -> some View {
        if #available(iOS 15, *) {
            return self.confirmationDialog(
                title: { _ in Text("") },
                titleVisibility: .hidden,
                unwrapping: {
                    let unwrapping = `enum`.case(casePath)
                    let isMatched = `case` == unwrapping.wrappedValue
                    return isMatched ? unwrapping : .constant(nil)
                }(),
                actions: actions,
                message: { _ in Text(message) }
            )
        } else {
            return self.alert(isPresented: Binding<Bool>(
                get: { `enum`.wrappedValue != nil },
                set: { if !$0 { `enum`.wrappedValue = nil } }
            ), content: {
                Alert(
                    title: Text(""),
                    message: Text(message),
                    primaryButton: .default(Text("Confirm"), action: {
                        if `enum`.wrappedValue != nil,
                           let caseValue = `enum`.wrappedValue as? Case {
                            _ = actions(caseValue)
                        }
                    }),
                    secondaryButton: .cancel {
                        `enum`.wrappedValue = nil
                    }
                )
            })
        }
    }
}

extension Binding {
    func isRemovedDuplicatesPresent<Wrapped>() -> Binding<Bool> where Value == Wrapped? {
        .init(
            get: { wrappedValue != nil },
            set: { isPresent, transaction in
                guard self.transaction(transaction).wrappedValue != nil else { return }
                if !isPresent {
                    self.transaction(transaction).wrappedValue = nil
                }
            }
        )
    }
}
