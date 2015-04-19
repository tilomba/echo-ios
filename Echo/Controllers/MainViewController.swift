//
//  MainViewController.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-05.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    var tokenList = TokenList()
    
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
        
        return false
    }
    
    func updateView() {
        textView.text = ""
        for token in tokenList {
            textView.text = textView.text + token.rawValue + " "
        }
    }
}

