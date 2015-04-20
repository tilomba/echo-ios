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
        setup()
        
        translationContainer.becomeFirstResponder()
    }
    
    func setup() {
        let dismissGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissGestureRecognizer:")
        dismissGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(dismissGestureRecognizer)
    }
    
    func dismissGestureRecognizer(sender: AnyObject) {
        println("PopupView Dismissed.")
        translationContainer.dismiss()
    }
}