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
    static var darkGray = UIColor(hexString: "#ABB0B6")
    static var blueTop = UIColor(hexString: "#314577")
    static var blueBottom = UIColor(hexString: "#8A88B0")
    static var orangeTop = UIColor(hexString: "#FFC972")
    static var orangeBottom = UIColor(hexString: "#FF8829")
    static var pinkTop = UIColor(hexString: "#DC746F")
    static var pinkOrangeBottom = UIColor(hexString: "#ED9348")
}

struct SDFont {
    
    enum SDFontSize: Float {
        case large = 30.0
        case largeSmall = 20.0
        case mediumLarger = 18.0
        case mediumLarge = 16.0
        case medium = 12.0
        case mediumSmall = 10.0
    }
    
    enum SDFontType: String {
        case bold = "Optima-ExtraBlack"
        case regular = "Optima-Regular"
        case medium = "Avenir-Medium"
        case mediumBlack = "Avenir-Black"
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

struct SDIconLabel {
    
    var text: String

    init(text: String) {
        self.text = text
    }
    
    var instance: UILabel {
        
        let label = UILabel()
        label.text = text
        label.textColor = SDColor.darkGray
        label.font = SDFont(type: .medium, size: .mediumSmall).instance
        
        return label
    }
}

