//
//  Image+Extension.swift
//  ChatAppGlopr
//
//  Created by Huy Nguyễn Dương Anh on 22/10/2023.
//

import Foundation
import SwiftUI
import UIKit

extension UIImage {
    class func random(size: CGSize = CGSize(width: 100, height: 100)) -> UIImage {
        let red = CGFloat(arc4random_uniform(255))
        let green = CGFloat(arc4random_uniform(255))
        let blue = CGFloat(arc4random_uniform(255))
        let color = UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.addRect(CGRect(origin: .zero, size: size))
        context?.fillPath()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}

extension Image {
    func full() -> some View {
        self
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}
