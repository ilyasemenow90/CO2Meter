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

    class func colorBetweenColor(startColor: UIColor, endColor: UIColor, position: CGFloat) -> UIColor {
        let red = startColor.redComponent + position * (endColor.redComponent - startColor.redComponent)
        let green = startColor.greenComponent + position * (endColor.greenComponent - startColor.greenComponent)
        let blue = startColor.blueComponent + position * (endColor.blueComponent - startColor.blueComponent)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    class CO2 {
        class func good() -> UIColor {
            return UIColor(hex: 0x1476F2, alpha: 1.0)
        }
        
        class func normal() -> UIColor {
            return UIColor(hex: 0x455B76, alpha: 1.0)
        }
        
        class func bad() -> UIColor {
            return UIColor(hex: 0x2E2E2E, alpha: 1.0)
        }
    }
}
