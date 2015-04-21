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
    
    var pasteButton: EmbeddedButton!
    var clearButton: EmbeddedButton!
    var copyButton: EmbeddedButton!
    
    struct Constants {
        static let radius = CGFloat(6)
        static let fontSize = CGFloat(17.0)
    }
    
    override public func prepareForInterfaceBuilder() {
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "theme", name: "theme", object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "theme", object: nil)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        layer.cornerRadius = Constants.radius
        layer.masksToBounds = true
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: ThemeManager.sharedInstance.blurStyle()))
        blurView.bounds = bounds
        blurView.center = center
        addSubview(blurView)
        
        let buttonRect = CGRect(x: 0.0, y: 0.0, width: bounds.size.width / 3.0, height: bounds.size.height)
        pasteButton = EmbeddedButton(title: "paste")
        pasteButton.frame = buttonRect
        pasteButton.center = CGPoint(x: bounds.size.width / 3.0 - bounds.size.width / 6.0, y: bounds.size.height / 2.0)
        pasteButton.addTarget(self, action: "pastePressed:", forControlEvents: .TouchDown)
        blurView.contentView.addSubview(pasteButton)

        clearButton = EmbeddedButton(title: "clear")
        clearButton.frame = buttonRect
        clearButton.center = CGPoint(x: bounds.size.width / 3.0 + bounds.size.width / 6.0, y: bounds.size.height / 2.0)
        clearButton.addTarget(self, action: "clearPressed:", forControlEvents: .TouchDown)
        blurView.contentView.addSubview(clearButton)
        
        copyButton = EmbeddedButton(title: "copy")
        copyButton.frame = buttonRect
        copyButton.center = CGPoint(x: bounds.size.width / 3.0 * 2.0 + bounds.size.width / 6.0, y: bounds.size.height / 2.0)
        copyButton.addTarget(self, action: "copyPressed:", forControlEvents: .TouchDown)
        blurView.contentView.addSubview(copyButton)
    }
    
    func theme() {
    }
    
    public func pastePressed(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("paste", object: self)
    }
    
    public func clearPressed(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("clear", object: self)
    }
    
    public func copyPressed(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("copy", object: self)
    }
}