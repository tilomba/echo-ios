//
//  ThemeManager.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-21.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class ThemeManager {
    
    var normal = false
    
    class var sharedInstance: ThemeManager {
        struct Singleton {
            static let instance = ThemeManager()
        }
        
        return Singleton.instance
    }
    
    
    // MARK: Styles
    func statusBarStyle() -> UIStatusBarStyle {
        return normal ? .Default : .LightContent
    }
    
    func blurStyle() -> UIBlurEffectStyle {
        return normal ? .Dark : .ExtraLight
    }
    
    // MARK: Colours
    func backgroundColor() -> UIColor {
        return normal ? UIColor(red: 0.941, green: 0.941, blue: 0.941, alpha: 1) : UIColor(red: 0.149, green: 0.149, blue: 0.149, alpha: 1)
    }
    
    func containerColor() -> UIColor {
        return normal ? UIColor(red: 0.858, green: 0.858, blue: 0.858, alpha: 1) : UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    func wordBlockColor() -> UIColor {
        return normal ? UIColor(red: 0.8, green: 0.321, blue: 0.321, alpha: 1) : UIColor(red: 1.0, green: 0.533, blue: 0.149, alpha: 1)
    }
    
    // MARK: Switch Function(s)
    func toggle() {
        normal = !normal
        NSNotificationCenter.defaultCenter().postNotificationName("theme", object: self)
    }
}
