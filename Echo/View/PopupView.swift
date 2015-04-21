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
    
    var pasteButton: UIButton!
    var clearButton: UIButton!
    var copyButton: UIButton!
    
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
        layer.backgroundColor = UIColor.blackColor().CGColor
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        blurView.bounds = bounds
        blurView.center = center
        addSubview(blurView)
        
        buttons()
    }
    
    private func buttons() {
        pasteButton = UIButton.buttonWithType(.Custom) as! UIButton
        pasteButton.setTitle("paste", forState: .Normal)
        pasteButton.setTitleColor(UIColor.lightThemeContainerColor(), forState: .Normal)
        pasteButton.frame = CGRect(x: 0.0, y: 0.0, width: 99.66, height: 93.0)
        pasteButton.titleLabel!.font = UIFont.helveticaNeueLight(Constants.fontSize)
        addSubview(pasteButton)
//        pasteButton.layer.borderWidth = 0.5
//        pasteButton.layer.borderColor = UIColor.lightGrayColor().CGColor
//        pasteButton.addTarget(self, action: "pastePressed:", forControlEvents: .TouchDown)
//        pasteButton.addTarget(self, action: "pasteReleased:", forControlEvents: .TouchUpInside | .TouchDragOutside)
        
        clearButton = UIButton.buttonWithType(.Custom) as! UIButton
        clearButton.setTitle("clear", forState: .Normal)
        clearButton.setTitleColor(UIColor.lightThemeContainerColor(), forState: .Normal)
        clearButton.frame = CGRect(x: 99.66, y: 0.0, width: 99.66, height: 93.0)
        clearButton.titleLabel!.font = UIFont.helveticaNeueLight(Constants.fontSize)
        addSubview(clearButton)
//        clearButton.layer.borderWidth = 0.5
//        clearButton.layer.borderColor = UIColor.lightGrayColor().CGColor
//        clearButton.addTarget(self, action: "clearPressed:", forControlEvents: UIControlEvents.TouchDown)
//        clearButton.addTarget(self, action: "clearReleased:", forControlEvents: .TouchUpInside | .TouchDragOutside)
        
        copyButton = UIButton.buttonWithType(.Custom) as! UIButton
        copyButton.setTitle("copy", forState: .Normal)
        copyButton.setTitleColor(UIColor.lightThemeContainerColor(), forState: .Normal)
        copyButton.frame = CGRect(x: 199.32, y: 0.0, width: 99.66, height: 93.0)
        copyButton.titleLabel!.font = UIFont.helveticaNeueLight(Constants.fontSize)
        addSubview(copyButton)
//        copyButton.layer.borderWidth = 0.5
//        copyButton.layer.borderColor = UIColor.lightGrayColor().CGColor
//        copyButton.addTarget(self, action: "copyPressed:", forControlEvents: UIControlEvents.TouchDown)
//        copyButton.addTarget(self, action: "copyReleased:", forControlEvents: .TouchUpInside | .TouchDragOutside)
    }
    
//    public func pastePressed(sender: AnyObject) {
//        println("paste")
//        pasteButton.bounds.size = CGSize(width: 94.66, height: 88.0)
//    }
//    
//    public func clearPressed(sender: AnyObject) {
//        println("clear")
//        clearButton.bounds.size = CGSize(width: 94.66, height: 88.0)
//    }
//    
//    public func copyPressed(sender: AnyObject) {
//        println("copy")
//        copyButton.bounds.size = CGSize(width: 94.66, height: 88.0)
//    }
//    
//    public func pasteReleased(sender: AnyObject) {
//        pasteButton.bounds.size = CGSize(width: 99.66, height: 93.0)
//    }
//    
//    public func clearReleased(sender: AnyObject) {
//        clearButton.bounds.size = CGSize(width: 99.66, height: 93.0)
//    }
//    
//    public func copyReleased(sender: AnyObject) {
//        copyButton.bounds.size = CGSize(width: 99.66, height: 93.0)
//    }
}