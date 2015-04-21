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
    }
    
    func setup() {
        let dismissGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissGestureRecognizer:")
        dismissGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(dismissGestureRecognizer)
        translationContainer.becomeFirstResponder()
    }
    
    func dismissGestureRecognizer(sender: AnyObject) {
        if translationContainer.popupVisible {
            translationContainer.dismiss()
        }
    }
}