//
//  Font+Extension.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 07/11/2023.
//

import SwiftUI

extension SwiftUI.Font {
    static func stBold(_ size: CGFloat) -> SwiftUI.Font {
        FontFamily.Montserrat.bold.swiftUIFont(size: size)
    }
}
