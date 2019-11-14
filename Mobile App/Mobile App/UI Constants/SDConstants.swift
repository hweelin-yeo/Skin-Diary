//
//  SDConstants.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/12/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

struct SDColor {
    static var turquoise = UIColor(hexString: "#60BA88")
    static var lightGray = UIColor(hexString: "#EEEEEE")
}

struct SDFont {
    
    enum SDFontSize: Float {
        case large = 30.0
        case medium = 12.0
        case mediumSmall = 10.0
    }
    
    enum SDFontType: String {
        case bold = "Optima-ExtraBlack"
        case regular = "Optima-Regular"
        case medium = "Avenir-Medium"
    }
    
    var type: SDFontType
    var size: SDFontSize
    
    init(type: SDFontType, size: SDFontSize) {
        self.type = type
        self.size = size
    }   
}

extension SDFont {
    
    var instance: UIFont {
        
        var instanceFont: UIFont
        
        guard let font = UIFont(name: type.rawValue, size: CGFloat(size.rawValue)) else {
            fatalError("Font is not available.")
        }
        
        instanceFont = font
        return instanceFont
    }
}
