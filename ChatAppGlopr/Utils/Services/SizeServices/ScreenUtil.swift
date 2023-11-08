//
//  ScreenUtil.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import Foundation
import UIKit

protocol ScreenUtilDelegate: AnyObject {
    func setSp(fontSize: Double) -> Double
    func radius(num: Double) -> Double
    func setHeight(height: Double) -> Double
    func setWidth(width: Double) -> Double
}

final class ScreenUtil {
    weak var delegate: ScreenUtilDelegate?

    static let defaultSize = CGSize(width: 390, height: 844)

    static let shared = ScreenUtil()

    private init() {}

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var scaleWidth: Double {
        Double(screenWidth) / 390
    }

    var scaleHeight: Double {
        Double(screenHeight) / 844
    }

    var scaleText: Double {
        min(scaleWidth, scaleHeight)
    }

    func setSp(fontSize: Double) -> Double {
        fontSize * scaleText
    }

    func radius(num: Double) -> Double {
        num * scaleText
    }

    func setHeight(height: Double) -> Double {
        height * scaleHeight
    }

    func setWidth(width: Double) -> Double {
        width * scaleWidth
    }
}
