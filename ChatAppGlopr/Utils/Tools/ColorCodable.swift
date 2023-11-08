//
//  ColorCodable.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 05/11/2023.
//

import SwiftUI
#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#elseif os(macOS)
import AppKit
#endif

@available(iOS 14.0, *)
private extension Color {
    #if os(macOS)
    typealias SystemColor = NSColor
    #else
    typealias SystemColor = UIColor
    #endif

    struct RGBA {
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let alpha: CGFloat
    }

    func convertUIColor(uiColor: UIColor) -> Color {
        return Color(red: Double(uiColor.cgColor.components![0]), green: Double(uiColor.cgColor.components![1]), blue: Double(uiColor.cgColor.components![2]))
    }

    var colorComponents: RGBA? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        #if os(macOS)
        SystemColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        #else
        guard SystemColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return nil }
        #endif

        return RGBA(red: red, green: green, blue: blue, alpha: alpha)
    }
}

@available(iOS 14.0, *)
extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case red, green, blue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let red = try container.decode(Double.self, forKey: .red)
        let green = try container.decode(Double.self, forKey: .green)
        let blue = try container.decode(Double.self, forKey: .blue)
        self.init(red: red, green: green, blue: blue)
    }

    public func encode(to encoder: Encoder) throws {
        guard let colorComponents = colorComponents else { return }
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(colorComponents.red, forKey: .red)
        try container.encode(colorComponents.green, forKey: .green)
        try container.encode(colorComponents.blue, forKey: .blue)
    }
}
