//
//  Image.swift
//  CO2
//
//  Created by Alex Kantaev on 6/17/16.
//  Copyright © 2016 Intellectsoft. All rights reserved.
//

import UIKit

extension UIImage {
    class func filledImageFrom(source: UIImage, withColor color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(source.size, false, UIScreen.mainScreen().scale)
        
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRectMake(0, 0, source.size.width, source.size.height);
        
        
        CGContextTranslateCTM(context, 0, source.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, .Fill);
        CGContextSetBlendMode(context, .SoftLight);

        CGContextDrawImage(context, rect, source.CGImage);
        
        let coloredImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return coloredImg;
    }
}
