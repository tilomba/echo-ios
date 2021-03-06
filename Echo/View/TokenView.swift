//
//  TokenView.swift
//  Echo
//
//  Created by Damon Jones on 4/19/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

@IBDesignable public class TokenView: UILabel {
    
    public struct Constants {
        static let xMargin: CGFloat = 8.0
        static let yMargin: CGFloat = 6.0
    }
    
    // MARK: - Public Variables
    override public var text: String? {
        didSet {
            sizeToFit()
            bounds = CGRectInset(bounds, -Constants.xMargin, -Constants.yMargin)
        }
    }
    
    var token: Token? {
        didSet {
            if let token = token {
                text = token.rawValue
            }
        }
    }
    
    // MARK: - Object life cycle
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector: "theme", name: "theme", object: nil)
        
        setup()
    }
 
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NSNotificationCenter
            .defaultCenter()
            .removeObserver(self, name: "theme", object: nil)
    }
    
    override public func prepareForInterfaceBuilder() {
        setup()
    }

    // MARK: - Setting up generics and theme(s)
    private func setup() {
        font = UIFont.avenirRoman(15)
        textAlignment = .Center
        theme()
    }
    
    public func theme() {
        backgroundColor = ThemeManager.sharedInstance.wordBlockColor()
        textColor = UIColor.wordBlockTextColor()
    }
}
