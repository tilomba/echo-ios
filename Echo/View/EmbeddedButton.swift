//
//  EmbeddedButton.swift
//  Echo
//
//  Created by Damon Jones on 4/20/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

@IBDesignable public class EmbeddedButton: UIButton {
    
    // MARK: - Private Variables
    private var pasteButton: UIButton!
    private var clearButton: UIButton!
    private var copyButton: UIButton!
    
    // MARK: - Object life cycle
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
    
    override public func prepareForInterfaceBuilder() {
        setup()
    }
    
    // MARK: - Setting up generics and theme(s)
    private func setup() {
        titleLabel!.font = UIFont.avenirRoman(Common.defaultFontSize)
        theme()
    }
    
    public func theme() {
        setTitleColor(ThemeManager.sharedInstance.containerColor(), forState: .Normal)
    }
}
