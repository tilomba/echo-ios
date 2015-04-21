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

        let dismissGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissGestureRecognizer:")
        dismissGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(dismissGestureRecognizer)
        translationContainer.becomeFirstResponder()
        
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipeUpGestureRecognizer:"))
        swipeUpGestureRecognizer.direction = .Up
        swipeUpGestureRecognizer.numberOfTouchesRequired = 2
        view.addGestureRecognizer(swipeUpGestureRecognizer)
        
        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipeDownGestureRecognizer:"))
        swipeDownGestureRecognizer.direction = .Down
        swipeDownGestureRecognizer.numberOfTouchesRequired = 2
        view.addGestureRecognizer(swipeDownGestureRecognizer)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "theme", name: "theme", object: nil)
        theme()
    }
    
    func theme() {
        view.backgroundColor = ThemeManager.sharedInstance.backgroundColor()
        ThemeManager.sharedInstance.statusBarStyle()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func swipeUpGestureRecognizer(sender: UISwipeGestureRecognizer) {
        ThemeManager.sharedInstance.lightTheme()
    }
    
    func swipeDownGestureRecognizer(sender: UISwipeGestureRecognizer) {
        ThemeManager.sharedInstance.darkTheme()
    }
    
    func dismissGestureRecognizer(sender: AnyObject) {
        if translationContainer.popupVisible {
            translationContainer.dismiss()
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return ThemeManager.sharedInstance.statusBarStyle()
    }
}