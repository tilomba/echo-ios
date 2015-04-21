//
//  MainViewController.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-05.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

public class MainViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var translationContainer: TranslationContainer!
    @IBOutlet weak var button: UIButton!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
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
    
    public func theme() {
        view.backgroundColor = ThemeManager.sharedInstance.backgroundColor()
        ThemeManager.sharedInstance.statusBarStyle()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "theme", object: nil)
    }
    
    public func swipeUpGestureRecognizer(sender: UISwipeGestureRecognizer) {
        ThemeManager.sharedInstance.lightTheme()
    }
    
    public func swipeDownGestureRecognizer(sender: UISwipeGestureRecognizer) {
        ThemeManager.sharedInstance.darkTheme()
    }
    
    public func dismissGestureRecognizer(sender: AnyObject) {
        if translationContainer.popupVisible {
            translationContainer.dismiss()
        }
    }
    
    override public func preferredStatusBarStyle() -> UIStatusBarStyle {
        return ThemeManager.sharedInstance.statusBarStyle()
    }
}