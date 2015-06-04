//
//  ActionView.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-20.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

@IBDesignable public class ActionView: UIView {
        
    // MARK: - Private Variables
    private var pasteButton: ActionButton!
    private var clearButton: ActionButton!
    private var copyButton: ActionButton!
    
    // MARK: - Object life cycle
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func prepareForInterfaceBuilder() {
        setup()
    }
    
    // MARK: - Setting up generics
    private func setup() {
        layer.cornerRadius = Common.radius
        layer.masksToBounds = true
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: ThemeManager.sharedInstance.blurStyle()))
        blurView.bounds = bounds
        blurView.center = center
        addSubview(blurView)
        
        let width = bounds.size.width / 3.0
        let widthOffset = width / 2.0
        let height = bounds.size.height
        let y = height / 2.0
        
        let buttonRect = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        pasteButton = ActionButton(title: "Paste")
        pasteButton.frame = buttonRect
        pasteButton.center = CGPoint(x: width - widthOffset, y: y)
        pasteButton.addTarget(self, action: "pastePressed:", forControlEvents: .TouchDown)
        blurView.contentView.addSubview(pasteButton)

        clearButton = ActionButton(title: "Clear")
        clearButton.frame = buttonRect
        clearButton.center = CGPoint(x: 2.0 * width - widthOffset, y: y)
        clearButton.addTarget(self, action: "clearPressed:", forControlEvents: .TouchDown)
        blurView.contentView.addSubview(clearButton)
        
        copyButton = ActionButton(title: "Copy")
        copyButton.frame = buttonRect
        copyButton.center = CGPoint(x: 3.0 * width - widthOffset, y: y)
        copyButton.addTarget(self, action: "copyPressed:", forControlEvents: .TouchDown)
        blurView.contentView.addSubview(copyButton)
    }
    
    // MARK: - Paste, copy and clear methods
    public func pastePressed(sender: AnyObject) {
        NSNotificationCenter
            .defaultCenter()
            .postNotificationName("paste", object: self)
    }
    
    public func clearPressed(sender: AnyObject) {
        NSNotificationCenter
            .defaultCenter()
            .postNotificationName("clear", object: self)
    }
    
    public func copyPressed(sender: AnyObject) {
        NSNotificationCenter
            .defaultCenter()
            .postNotificationName("copy", object: self)
    }
}