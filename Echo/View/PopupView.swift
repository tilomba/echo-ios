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
        static let radius = CGFloat(6)
        static let fontSize = CGFloat(17.0)
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
        layer.cornerRadius = Constants.radius
        layer.masksToBounds = true
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        blurView.bounds = bounds
        blurView.center = center
        addSubview(blurView)
        
        buttons()
    }
    
    private func buttons() {
        let pasteButton = UIButton.buttonWithType(.Custom) as! UIButton
        pasteButton.setTitle("paste", forState: .Normal)
        pasteButton.setTitleColor(UIColor.lightThemeContainerColor(), forState: .Normal)
        pasteButton.frame = CGRect(x: 0.0, y: 0.0, width: 99.66, height: 93.0)
        pasteButton.titleLabel!.font =  UIFont.helveticaNeueLight(Constants.fontSize)
        addSubview(pasteButton)
        
        let clearButton = UIButton.buttonWithType(.Custom) as! UIButton
        clearButton.setTitle("clear", forState: .Normal)
        clearButton.setTitleColor(UIColor.lightThemeContainerColor(), forState: .Normal)
        clearButton.frame = CGRect(x: 99.66, y: 0.0, width: 99.66, height: 93.0)
        clearButton.titleLabel!.font =  UIFont.helveticaNeueLight(Constants.fontSize)
        addSubview(clearButton)
        
        let copyButton = UIButton.buttonWithType(.Custom) as! UIButton
        copyButton.setTitle("copy", forState: .Normal)
        copyButton.setTitleColor(UIColor.lightThemeContainerColor(), forState: .Normal)
        copyButton.frame = CGRect(x: 199.32, y: 0.0, width: 99.66, height: 93.0)
        copyButton.titleLabel!.font =  UIFont.helveticaNeueLight(Constants.fontSize)
        addSubview(copyButton)
    }
}