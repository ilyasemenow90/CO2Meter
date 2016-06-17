//
//  Co2MeterViewController.swift
//  CO2
//
//  Created by Alex Kantaev on 6/16/16.
//  Copyright © 2016 Intellectsoft. All rights reserved.
//

import UIKit

class Co2MeterViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backgroundView: Co2MeterBackgroundView!
    @IBOutlet weak var ppmLabel: UILabel!
    var co2: CO2Value?
    
    let mountainsImage = UIImage.init(named: "mountains")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CO2Value.getLastValue { result in
            switch result {
            case .Success(let value):
                self.co2 = value
                self.ppmLabel.text = "\((self.co2?.valueCO2)!)"
                self.updateBackground()
                break
                
            case .Failure(let error):
                self.showError("Backendless Error", message: error.localizedDescription)
            }
        }

        
    }
    
    func updateBackground() {
        UIView.animateWithDuration(1.0) {
            self.backgroundImageView.image = UIImage.filledImageFrom(self.mountainsImage, withColor:self.backgroundColorForPpm((self.co2?.valueCO2)!))
        }
    }
    
    func backgroundColorForPpm(ppm: Int) -> UIColor {
        switch ppm {
        case 0..<Settings.CO2.good:
            return UIColor.CO2.good()
        case Settings.CO2.good..<Settings.CO2.normal:
            let position = CGFloat(ppm - Settings.CO2.good)/CGFloat(Settings.CO2.normal - Settings.CO2.good)
            return UIColor.colorBetweenColor(UIColor.CO2.good(), endColor: UIColor.CO2.normal(), position: position)
        case Settings.CO2.normal..<Settings.CO2.bad:
            let position = CGFloat(ppm - Settings.CO2.normal)/CGFloat(Settings.CO2.bad - Settings.CO2.normal)
            return UIColor.colorBetweenColor(UIColor.CO2.normal(), endColor: UIColor.CO2.bad(), position: position)
        case Settings.CO2.bad..<Int.max:
            return UIColor.CO2.bad()
        default:
            break
        }
        
        return UIColor.clearColor()
    }
}
