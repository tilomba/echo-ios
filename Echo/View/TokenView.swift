//
//  TokenView.swift
//  Echo
//
//  Created by Damon Jones on 4/19/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

@IBDesignable
public class TokenView: UILabel {
    struct Constants {
        static let xMargin = CGFloat(8.0)
        static let yMargin = CGFloat(6.0)
    }
    
    override public var text: String? {
        didSet {
            sizeToFit()
            bounds = CGRectInset(bounds, -Constants.xMargin, -Constants.yMargin)
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = UIColor.lightThemeWordBlockColor()
        textColor = UIColor.wordBlockTextColor()
        font = UIFont.avenirRoman(15)
        textAlignment = .Center
    }
}
