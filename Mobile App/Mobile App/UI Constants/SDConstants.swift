//
//  SDConstants.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/12/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

struct SDFont {
    
    enum SDFontSize: Float {
        case large = 30.0
        case medium = 12.0
    }
    
    enum SDFontType: String {
        case bold = "Optima-Bold"
        case regular = "Optima-Regular"
        case medium = "Avenir-Medium"
    }
    
    var type: SDFontType
    
    init(type: SDFontType) {
        self.type = type
    }   
}

extension SDFont {
    
    var instance: UIFont {
        
        var instanceFont: UIFont
        
        switch type {
            
        case .bold:
            guard let font =  UIFont(name: type.rawValue, size: CGFloat(SDFontSize.large.rawValue)) else {
                fatalError("Font is not available.")
            }
            
            instanceFont = font
            return instanceFont
            
        case .regular:
            guard let font =  UIFont(name: type.rawValue, size: CGFloat(SDFontSize.medium.rawValue)) else {
                fatalError("Font is not available.")
            }
            instanceFont = font
            return instanceFont
            
        case .medium:
            guard let font =  UIFont(name: type.rawValue, size: CGFloat(SDFontSize.medium.rawValue)) else {
                fatalError("Font is not available.")
            }
            instanceFont = font
            return instanceFont
        }
    
    }
}
