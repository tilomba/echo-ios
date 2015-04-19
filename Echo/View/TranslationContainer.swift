//
//  TranslationContainer.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-19.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class TranslationContainer: UIView, UIKeyInput {
    
    struct Constants {
        static let spacing = CGFloat(12.0)
    }
    
    var tokenList = TokenList()
    var tokenViews = [TokenView]()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func insertText(text: String) {
        tokenList += NATODictionary.translateString(text)
        setNeedsDisplay()
    }
    
    func deleteBackward() {
        if !tokenList.isEmpty {
            tokenList.removeLast()
            
            setNeedsDisplay()
        }
    }
    
    func hasText() -> Bool {
        return !tokenList.isEmpty
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func drawRect(rect: CGRect) {
        for tokenView in tokenViews {
            tokenView.removeFromSuperview()
        }
        tokenViews.removeAll()
        
        var insertPoint = CGPoint(x: 0.0, y: 0.0)
        
        for token in tokenList {
            let tokenView = TokenView(frame: CGRectZero)
            tokenView.text = token.rawValue
            
            if insertPoint.x + tokenView.bounds.maxX + Constants.spacing >= bounds.maxX {
                insertPoint.x = 0.0
                insertPoint.y += tokenView.bounds.height + Constants.spacing
            }
            
            tokenView.center = CGPoint(x: tokenView.bounds.midX + insertPoint.x, y: tokenView.bounds.midY + insertPoint.y)
            
            addSubview(tokenView)
            tokenViews.append(tokenView)
            
            insertPoint.x += tokenView.bounds.width + Constants.spacing
        }
    }
}
