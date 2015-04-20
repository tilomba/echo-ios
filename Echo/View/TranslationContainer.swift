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
    
    func draw(newTokens: TokenList) {
        for token in newTokens {
            let tokenView = TokenView(frame: CGRectZero)
            tokenView.text = token.rawValue
            
            // check if the insertion point needs to be moved down a line because it's too wide to fit on the current line
            let oldInsertPoint = insertPoint
            adjustInsertPointForTokenView(tokenView)
            
            if canAdd {
                let position = CGPoint(x: tokenView.bounds.midX + insertPoint.x, y: tokenView.bounds.midY + insertPoint.y)
                tokenView.center = CGPoint(x: bounds.midX, y: bounds.maxY + 75.0)
                
                addSubview(tokenView)
                tokenViews.append(tokenView)
                
                UIView.animateWithDuration(0.15) {
                    tokenView.center = position
                }
                
                moveInsertPoint(tokenView.bounds.size)
            } else {
                insertPoint = oldInsertPoint
                canAdd = true
            }
        }
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
    
    @IBAction func longPressGestureRecognizer(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began {
            println("Received.")
            
            if nil == popupView {
                popupView = PopupView(frame: CGRect(x: 0.0, y: 0.0, width: 299.0, height: 93.0))
            }
            
            addSubview(popupView!)
            popupView!.center = CGPoint(x: bounds.midX, y: bounds.midY)
            popupView!.layer.zPosition = 100
            
            editingActive = false
            popupVisible = true
        }
    }
    
    func dismiss() {
        if popupVisible {
            popupView!.removeFromSuperview()
            popupVisible = false
        }
    }
}
