//
//  BlurView.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-06-04.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class BlurView: UIVisualEffectView {
    
    class func setup(effect: UIBlurEffectStyle, bounds: CGRect, center: CGPoint) -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        blurView.bounds = bounds
        blurView.center = center
        
        return blurView
    }
}
