//
//  View+Extension.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 05/11/2023.
//

import SwiftUI

public extension View {
    func fillBackground(image: Image) -> some View {
        return frame(maxWidth: .infinity, maxHeight: .infinity).background(
            image
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}
