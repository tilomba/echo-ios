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

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if let translation = NATODictionary.translateCharacter(text as String) {
            textView.text = textView.text + translation + " "

            return false
        }
        
        return true
    }
}

