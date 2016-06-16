//
//  Co2MeterBackgroundView.swift
//  CO2
//
//  Created by Alex Kantaev on 6/16/16.
//  Copyright © 2016 Intellectsoft. All rights reserved.
//

import UIKit

class Co2MeterBackgroundView: UIView {    
    func updateColorWithCO2(co2: Int) {
        let desaturate = Double(co2)/Double(Settings.CO2.max-Settings.CO2.min)
        self.backgroundColor = UIColor.CO2.blue().desaturateColor(desaturate)
    }
}
