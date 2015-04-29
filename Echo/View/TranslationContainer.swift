//
//  TranslationContainer.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-19.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

public class TranslationContainer: UIView, UIGestureRecognizerDelegate {
    
    private var insertPoint = CGPoint(x: Constants.xStartPosition + TokenView.Constants.xMargin, y: Constants.yStartPosition + TokenView.Constants.yMargin)
    private var popupView: PopupView?
    private var editingActive = true
    public var popupVisible = false
    
    private struct Constants {
        static let spacing = CGFloat(10.0)
        static let xStartPosition = CGFloat(10.0)
        static let yStartPosition = CGFloat(13.0)
        static let popupRect = CGRect(x: 0.0, y: 0.0, width: 299.0, height: 93.0)
    }
    
    private var tokenViews = [TokenView]()
    private var canAdd = true
    
    // MARK: init/deinit
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        theme()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "theme", name: "theme", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "pasteTokens:", name: "paste", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "clearTokensFromView:", name: "clear", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "copyTokens:", name: "copy", object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "theme", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "paste", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "clear", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "copy", object: nil)
    }
    
    // MARK: theme
    public func theme() {
        backgroundColor = ThemeManager.sharedInstance.containerColor()
        
        if let popupView = popupView {
            popupView.removeFromSuperview()
        }
        
        popupView = PopupView(frame: Constants.popupRect)
        
        if popupVisible {
            addSubview(popupView!)
            popupView!.center = CGPoint(x: bounds.midX, y: bounds.midY)
            popupView!.layer.zPosition = 100
        }
    }
    
    // UIKeyInput
//    public func insertText(text: String) {
//        if !editingActive {
//            return
//        }
//        
//        let newTokens = NATODictionary.translateString(text)
//        draw(newTokens)
//    }
//    
//    public func deleteBackward() {
//        if !editingActive {
//            return
//        }
//        
//        if tokenViews.isEmpty {
//            return
//        }
//        
//        let tokenViewToRemove = tokenViews.removeLast()
//        moveInsertPointAfterTokenView(tokenViewToRemove)
//        
//        UIView.animateWithDuration(0.15, animations: {
//            tokenViewToRemove.center = CGPoint(x: self.bounds.midX, y: self.bounds.maxY + 75.0)
//        }) { (completed) -> Void in
//            tokenViewToRemove.removeFromSuperview()
//        }
//    }
//    
//    public func hasText() -> Bool {
//        return !tokenViews.isEmpty
//    }
    
//    override public func canBecomeFirstResponder() -> Bool {
//        return true
//    }
    
    // MARK: Editing methods
    private func draw(newTokens: TokenList, fromPaste: Bool = false) {
        for token in newTokens {
            let tokenView = TokenView(frame: CGRectZero)
            tokenView.token = token
            
            // check if the insertion point needs to be moved down a line because it's too wide to fit on the current line
            let oldInsertPoint = insertPoint
            adjustInsertPointForTokenView(tokenView)
            
            if canAdd {
                tokenViews.append(tokenView)
                addSubview(tokenView)
                
                let position = CGPoint(x: tokenView.bounds.midX + insertPoint.x, y: tokenView.bounds.midY + insertPoint.y)
                tokenView.center = position
                
                if !fromPaste {
                    tokenView.center = CGPoint(x: bounds.midX, y: bounds.maxY + 75.0)
                
                    UIView.animateWithDuration(0.15) {
                        tokenView.center = position
                    }
                }
                
                moveInsertPoint(tokenView.bounds.size)
            } else {
                insertPoint = oldInsertPoint
                canAdd = true
            }
        }
        
        if fromPaste {
            for tokenView in tokenViews {
                let position = tokenView.center
                tokenView.center = popupView!.center
                
                UIView.animateWithDuration(0.15, animations: {
                    tokenView.center = position
                }, completion: { (completed) -> Void in
                    if tokenView == self.tokenViews.last {
                        self.dismiss()
                    }
                })
            }
        }
    }
    
    private func clearTokens() {
        for tokenView in tokenViews {
            tokenView.removeFromSuperview()
        }
        
        tokenViews.removeAll()
        
        resetInsertPoint()
    }
    
    private func moveInsertPointAfterTokenView(tokenView: TokenView) {
        insertPoint.y = tokenView.center.y - tokenView.bounds.midY
        insertPoint.x = tokenView.center.x - tokenView.bounds.midX
        if insertPoint.x >= bounds.maxX {
            moveDownALine(tokenView.bounds.size.height)
        }
    }
    
    private func moveInsertPoint(tokenSize: CGSize) {
        insertPoint.x += tokenSize.width + Constants.spacing
        if insertPoint.x >= bounds.maxX {
            moveDownALine(tokenSize.height)
        }
    }
    
    private func moveDownALine(height: CGFloat) {
        insertPoint.x = Constants.xStartPosition + TokenView.Constants.xMargin
        insertPoint.y += height + Constants.spacing
        
        if insertPoint.y >= bounds.maxY {
            canAdd = false
        }
    }
    
    private func adjustInsertPointForTokenView(tokenView: TokenView) {
        if insertPoint.x + tokenView.bounds.size.width >= bounds.maxX {
            moveDownALine(tokenView.bounds.size.height)
        }
    }
    
    private func resetInsertPoint() {
        insertPoint = CGPoint(x: Constants.xStartPosition + TokenView.Constants.xMargin, y: Constants.yStartPosition + TokenView.Constants.yMargin)
    }
    
    // MARK: Popup methods
    @IBAction func longPressGestureRecognizer(sender: AnyObject) {
        if popupVisible {
            return
        }
        
        if sender.state == UIGestureRecognizerState.Began {
            if nil == popupView {
                popupView = PopupView(frame: Constants.popupRect)
            }
            
            addSubview(popupView!)
            popupView!.center = CGPoint(x: bounds.midX, y: bounds.midY)
            popupView!.layer.zPosition = 100
            
            editingActive = false
            popupVisible = true
            
            let finalRect = popupView!.bounds
            popupView!.bounds = CGRectZero
            UIView.animateWithDuration(0.15) {
                self.popupView!.bounds = finalRect
            }
        }
    }
    
    public func dismiss() {
        if popupVisible {
            UIView.animateWithDuration(0.15, animations: {
                self.popupView!.bounds = CGRectZero
            }, completion: { (completed) -> Void in
                self.popupView!.removeFromSuperview()
                self.popupView!.bounds = Constants.popupRect
                self.popupVisible = false
                self.editingActive = true
            })
        }
    }
    
    // MARK: Notification methods
    public func pasteTokens(sender: AnyObject) {
        if let pasteboardString = UIPasteboard.generalPasteboard().string {
            clearTokens()
            draw(NATODictionary.translateString(pasteboardString), fromPaste: true)
        } else {
            dismiss()
        }
    }
    
    public func clearTokensFromView(sender: AnyObject) {
        clearTokens()
        dismiss()
    }
    
    public func copyTokens(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = tokenViews.map { $0.token!.rawValue }.reduce("", combine: { $0! + " " + $1 })
        dismiss()
    }
}
