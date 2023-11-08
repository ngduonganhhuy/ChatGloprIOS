//
//  WelcomeView.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 06/11/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            textWelcome
            20.ph
            btnRegister
            73.ph
        }
        .padding(.horizontal, 20.r)
        .fillBackground(image: Asset.backgroundWelcome.swiftUIImage)
    }
}

// MARK: - Component

extension WelcomeView {
    @ViewBuilder
    var textWelcome: some View {
        Text(L10n.Welcome.text)
            .font(.stBold(24.sp))
            .foregroundColor(Asset.kWhite.swiftUIColor)
            .frame(maxWidth: 341.w)
            .center
    }

    @ViewBuilder
    var btnRegister: some View {
        Button {} label: {
            Text(L10n.Welcome.register)
                .font(.stBold(16.sp))
                .foregroundColor(Asset.kBlack.swiftUIColor)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(PressEffectButtonStyle())
    }
    
    @ViewBuilder
    var btnAlreadyHaveAccount: some View {
        
    }
}

#Preview {
    WelcomeView()
        .environment(\.locale, .init(identifier: "en"))
}
