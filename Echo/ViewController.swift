//
//  ViewController.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-05.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func textViewDidChangeSelection(textView: UITextView) {
//        debugPrintln(textView.selectedRange)
    }
    
    func textViewDidChange(textView: UITextView) {
//        println(".")
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if text.isEmpty && 1 == range.length {
            var index = range.location
            while index > 0 && " " != textView.text[advance(textView.text.startIndex, index)] {
                index--
            }
            debugPrintln(index)
            debugPrintln(textView.text[advance(textView.text.startIndex, index)])
            
            let newRange = textView.text.startIndex...advance(textView.text.startIndex, index)
            textView.text = textView.text[newRange]
            
            return true
        }
        
        if let translation = NATODictionary.translateCharacter(text as String) {
            textView.text = textView.text + translation + " "

            return false
        }
        
        return true
    }
}

