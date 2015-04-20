//
//  MainViewController.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-05.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var translationContainer: TranslationContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        translationContainer.becomeFirstResponder()
    }
    
    @IBAction func dismissGestureRecognizer(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began {
            println("Dismissed.")
            translationContainer.dismiss()
        }
    }
}