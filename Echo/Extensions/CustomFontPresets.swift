//
//  CustomFontPresets.swift
//
//  Created by Douglas Bumby on 2015-04-19.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

extension UIFont {
    class func avenirRoman(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Roman", size: size)!
    }
    
    // Other Styles
    class func helveticaNeueMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
    
    class func helveticaNeueRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Regular", size: size)!
    }
    
    class func helveticaNeueThin(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-UltraLight", size: size)!
    }
}