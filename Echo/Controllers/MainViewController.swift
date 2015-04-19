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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        // Translate
        if !text.isEmpty {
            let tokens = NATODictionary.translateString(text as String)
            for token in tokens {
                textView.text = textView.text + token + " "
            }
            
            return false
        } else if 1 == range.length {
            var index = range.location
            while index > 0 && " " != textView.text[advance(textView.text.startIndex, index)] {
                index--
            }
            
            let newRange = textView.text.startIndex...advance(textView.text.startIndex, index)
            textView.text = textView.text[newRange]
        }
        
        return true
    }
}

