//
//  Co2MeterViewController.swift
//  CO2
//
//  Created by Alex Kantaev on 6/16/16.
//  Copyright © 2016 Intellectsoft. All rights reserved.
//

import UIKit

class Co2MeterViewController: UIViewController {
    @IBOutlet weak var backgroundView: Co2MeterBackgroundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBackgound()
    }
    
    func updateBackgound() {
        UIView.animateWithDuration(1.0) {
            self.backgroundView.updateColorWithCO2(1500)
        }
    }
}
