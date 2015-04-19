//
//  MainViewController.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-05.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextViewDelegate {
    
    struct Constants {
        static let spacing = CGFloat(12.0)
    }
    
    @IBOutlet weak var tokenViewContainer: UIView!
    @IBOutlet weak var textView: UITextView!
    var tokenList = TokenList()
    var tokenViews = [TokenView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if !text.isEmpty {
            tokenList += NATODictionary.translateString(text as String)
        } else if 1 == range.length {
            tokenList.removeLast()
        }
        
        updateView()
        
        return true
    }
    
    func updateView() {
        textView.text = ""
        for tokenView in tokenViews {
            tokenView.removeFromSuperview()
        }
        tokenViews.removeAll()
        
        var insertPoint = CGPoint(x: 0.0, y: 0.0)
        
        for token in tokenList {
//            textView.text = texiew.text + token.rawValue + " "
            
            let tokenView = TokenView(frame: CGRectZero)
            tokenView.text = token.rawValue
            
            if insertPoint.x + tokenView.bounds.maxX + Constants.spacing >= tokenViewContainer.bounds.maxX {
                insertPoint.x = 0.0
                insertPoint.y += tokenView.bounds.height + Constants.spacing
            }
            
            tokenView.center = CGPoint(x: tokenView.bounds.midX + insertPoint.x, y: tokenView.bounds.midY + insertPoint.y)
            
            tokenViewContainer.addSubview(tokenView)
            tokenViews.append(tokenView)
            
            insertPoint.x += tokenView.bounds.width + Constants.spacing
        }
    }
}

