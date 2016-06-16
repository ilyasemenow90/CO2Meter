//
//  Color.swift
//  CO2
//
//  Created by Alex Kantaev on 6/16/16.
//  Copyright © 2016 Intellectsoft. All rights reserved.
//

import UIKit
import DynamicColor

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: alpha)
    }

    
    class CO2 {
        class func blue() -> UIColor {
            return UIColor(hex: 0x1476F2, alpha: 0.6)
        }
    }
}
