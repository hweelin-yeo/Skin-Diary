//
//  UIView+Extension.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/22/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit
extension UIView {
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

