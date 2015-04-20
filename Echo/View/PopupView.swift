//
//  PopupView.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-20.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

@IBDesignable
public class PopupView: UIView {
    struct Constants {
        static var radius = CGFloat(200)
    }
    
    override public func prepareForInterfaceBuilder() {
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        layer.cornerRadius = 6
        layer.masksToBounds = true
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        blurView.bounds = bounds
        blurView.center = center
        addSubview(blurView)
    }
}