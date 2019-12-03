//
//  LaunchScreenController.swift
//  dayly
//
//  Created by Yeo Hwee Lin on 12/3/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        addIcon()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.locations = [0.0, 0.3]
        gradientLayer.colors = [SDColor.orangeTop.cgColor, SDColor.orangeBottom.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func addIcon() {
        
    }
}
