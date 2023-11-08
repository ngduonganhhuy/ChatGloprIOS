//
//  Number+Extension.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import Foundation
import SwiftUI

extension Double {
    var pw: some View {
        Spacer()
            .frame(width: CGFloat(self.w))
    }

    var ph: some View {
        Spacer()
            .frame(height: CGFloat(self.h))
    }

    var sp: Double {
        ScreenUtil.shared.setSp(fontSize: self)
    }

    var r: Double {
        ScreenUtil.shared.radius(num: self)
    }

    var sw: Double {
        self * ScreenUtil.shared.screenWidth
    }

    var sh: Double {
        self * ScreenUtil.shared.screenHeight
    }

    var h: Double {
        ScreenUtil.shared.setHeight(height: self)
    }

    var w: Double {
        ScreenUtil.shared.setWidth(width: self)
    }
}
