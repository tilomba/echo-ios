//
//  MainViewController.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-05.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var translationContainer: UIView!
    let popupView = PopupView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        translationContainer.becomeFirstResponder()
    }
    
    @IBAction func longPressGestureRecognizer(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began {
            println("Received.")
            view.addSubview(popupView)
        }
    }
}