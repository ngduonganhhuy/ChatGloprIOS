//
//  PressEffectButtonStyle.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 07/11/2023.
//

import SwiftUI

struct PressEffectButtonStyle: ButtonStyle {
    var backgroundColor: Color?
    var foregroundColor: Color?

    init(backgroundColor: Color? = Asset.kWhite.swiftUIColor, foregroundColor: Color? = Asset.kBlack.swiftUIColor) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}
