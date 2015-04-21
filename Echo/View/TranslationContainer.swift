//
//  TranslationContainer.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-19.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class TranslationContainer: UIView, UIKeyInput, UIGestureRecognizerDelegate {
    
    var insertPoint = CGPoint(x: Constants.xStartPosition + TokenView.Constants.xMargin, y: Constants.yStartPosition + TokenView.Constants.yMargin)
    var popupView: PopupView?
    var editingActive = true
    var popupVisible = false
    
    struct Constants {
        static let spacing = CGFloat(10.0)
        static let xStartPosition = CGFloat(10.0)
        static let yStartPosition = CGFloat(13.0)
    }
    
    var tokenList = TokenList()
    var tokenViews = [TokenView]()
    var canAdd = true
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "pasteTokens:", name: "paste", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "clearTokensFromView:", name: "clear", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "copyTokens:", name: "copy", object: nil)
    }
    
    func insertText(text: String) {
        if !editingActive {
            return
        }
        
        let newTokens = NATODictionary.translateString(text)
        tokenList += newTokens
        draw(newTokens)
    }
    
    func deleteBackward() {
        if !editingActive {
            return
        }
        
        if tokenList.isEmpty {
            return
        }
        
        tokenList.removeLast()
        
        if tokenViews.isEmpty {
            return
        }
        
        let tokenViewToRemove = tokenViews.removeLast()
        moveInsertPointAfterTokenView(tokenViewToRemove)
        
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            tokenViewToRemove.center = CGPoint(x: self.bounds.midX, y: self.bounds.maxY + 75.0)
        }) { (completed) -> Void in
            tokenViewToRemove.removeFromSuperview()
        }
    }
    
    func hasText() -> Bool {
        return !tokenList.isEmpty
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    func draw(newTokens: TokenList, fromPaste: Bool = false) {
        if fromPaste {
            tokenList.removeAll()
            tokenList = newTokens
        }
        
        for token in newTokens {
            let tokenView = TokenView(frame: CGRectZero)
            tokenView.text = token.rawValue
            
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
    
    func clearTokens() {
        for tokenView in tokenViews {
            tokenView.removeFromSuperview()
        }
        
        tokenViews.removeAll()
        tokenList.removeAll()
        
        resetInsertPoint()
    }
    
    func moveInsertPointAfterTokenView(tokenView: TokenView) {
        insertPoint.y = tokenView.center.y - tokenView.bounds.midY
        insertPoint.x = tokenView.center.x - tokenView.bounds.midX
        if insertPoint.x >= bounds.maxX {
            moveDownALine(tokenView.bounds.size.height)
        }
    }
    
    func moveInsertPoint(tokenSize: CGSize) {
        insertPoint.x += tokenSize.width + Constants.spacing
        if insertPoint.x >= bounds.maxX {
            moveDownALine(tokenSize.height)
        }
    }
    
    func moveDownALine(height: CGFloat) {
        insertPoint.x = Constants.xStartPosition + TokenView.Constants.xMargin
        insertPoint.y += height + Constants.spacing
        
        if insertPoint.y >= bounds.maxY {
            canAdd = false
        }
    }
    
    func adjustInsertPointForTokenView(tokenView: TokenView) {
        if insertPoint.x + tokenView.bounds.size.width >= bounds.maxX {
            moveDownALine(tokenView.bounds.size.height)
        }
    }
    
    func resetInsertPoint() {
        insertPoint = CGPoint(x: Constants.xStartPosition + TokenView.Constants.xMargin, y: Constants.yStartPosition + TokenView.Constants.yMargin)
    }
    
    @IBAction func longPressGestureRecognizer(sender: AnyObject) {
        if popupVisible {
            return
        }
        
        if sender.state == UIGestureRecognizerState.Began {
            if nil == popupView {
                popupView = PopupView(frame: CGRect(x: 0.0, y: 0.0, width: 299.0, height: 93.0))
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
    
    func dismiss() {
        if popupVisible {
            UIView.animateWithDuration(0.15, animations: { () -> Void in
                self.popupView!.bounds = CGRectZero
            }, completion: { (completed) -> Void in
                self.popupView!.removeFromSuperview()
                self.popupView!.bounds = CGRect(x: 0.0, y: 0.0, width: 299.0, height: 93.0)
                self.popupVisible = false
                self.editingActive = true
            })
        }
    }
    
    func pasteTokens(sender: AnyObject) {
        if let pasteboardString = UIPasteboard.generalPasteboard().string {
            clearTokens()
            draw(NATODictionary.translateString(pasteboardString), fromPaste: true)
        } else {
            dismiss()
        }
    }
    
    func clearTokensFromView(sender: AnyObject) {
        clearTokens()
        dismiss()
    }
    
    func copyTokens(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = tokenList.map { $0.rawValue }.reduce("", combine: { $0! + " " + $1 })
        dismiss()
    }
}
