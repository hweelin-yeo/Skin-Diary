//
//  UIView+Extension.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/21/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

extension UIView {
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
}
