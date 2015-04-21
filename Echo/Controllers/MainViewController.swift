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
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        view.backgroundColor = ThemeManager.sharedInstance.backgroundColor()
        
        let dismissGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissGestureRecognizer:")
        dismissGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(dismissGestureRecognizer)
        translationContainer.becomeFirstResponder()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        swipe.direction = .Up
        view.addGestureRecognizer(swipe)
        
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        println("handleSwipes:")
    }
    
    func dismissGestureRecognizer(sender: AnyObject) {
        if translationContainer.popupVisible {
            translationContainer.dismiss()
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return ThemeManager.sharedInstance.statusBarStyle()
    }
    
    @IBAction func swipeUp(sender: UISwipeGestureRecognizer) {
        println("swipe up")
    }
    
    @IBAction func changeTheme() {
        println("test")
        
        ThemeManager.sharedInstance.toggle()
    }
    
}