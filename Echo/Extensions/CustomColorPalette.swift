//
//  CustomColorPalette.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-19.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: Light
    class func lightThemeBackgroundColor() -> UIColor {
        return UIColor(red: 0.941, green: 0.941, blue: 0.941, alpha: 1)
    }
    
    class func lightThemeContainerColor() -> UIColor {
        return UIColor(red: 0.858, green: 0.858, blue: 0.858, alpha: 1)
    }
    
    class func lightThemeWordBlockColor() -> UIColor {
        return UIColor(red: 0.8, green: 0.321, blue: 0.321, alpha: 1)
    }
    
    // MARK: Dark
    class func darkThemeBackgroundColor() -> UIColor {
        return UIColor(red: 0.149, green: 0.149, blue: 0.149, alpha: 1)
    }
    
    class func darkThemeContainerColor() -> UIColor {
        return UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    class func darkThemeWordBlockColor() -> UIColor {
        return UIColor(red: 1.0, green: 0.533, blue: 0.149, alpha: 1)
    }
    
    // MARK: Text
    class func wordBlockTextColor() -> UIColor {
        return UIColor.whiteColor()
    }
}