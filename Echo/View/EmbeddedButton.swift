//
//  EmbeddedButton.swift
//  Echo
//
//  Created by Damon Jones on 4/20/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

@IBDesignable public class EmbeddedButton: UIButton {
    
    private struct Constants {
        static let radius: CGFloat = 6.0
        static let fontSize: CGFloat = 14.5
    }
    
    private var pasteButton: UIButton!
    private var clearButton: UIButton!
    private var copyButton: UIButton!
    
    override public func prepareForInterfaceBuilder() {
        setup()
    }
    
    public init(title: String) {
        super.init(frame: CGRectZero)

        setTitle(title, forState: .Normal)
        setup()
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector: "theme", name: "theme", object: nil)
    }
    
    deinit {
        NSNotificationCenter
            .defaultCenter()
            .removeObserver(self, name: "theme", object: nil)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        titleLabel!.font = UIFont.avenirRoman(Constants.fontSize)
        theme()
    }
    
    public func theme() {
        setTitleColor(ThemeManager.sharedInstance.containerColor(), forState: .Normal)
    }
}
