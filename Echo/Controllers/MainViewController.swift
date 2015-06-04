//
//  MainViewController.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-05.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

public class MainViewController: UIViewController {
    
    // MARK: - Private Variables
    @IBOutlet weak var containerView: ContainerView!
    @IBOutlet weak var button: UIButton!
    
    // MARK: - Object life cycle
    override public func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    deinit {
        NSNotificationCenter
            .defaultCenter()
            .removeObserver(self, name: "theme", object: nil)
    }
    
    // MARK: - Setting up generics and theme(s)
    private func setup() {
        containerView.scrollView.contentSize = containerView.bounds.size
        
        let dismissGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissGestureRecognizer:")
        dismissGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(dismissGestureRecognizer)
                
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipeUpGestureRecognizer:"))
        swipeUpGestureRecognizer.direction = .Up
        swipeUpGestureRecognizer.numberOfTouchesRequired = 2
        view.addGestureRecognizer(swipeUpGestureRecognizer)
        
        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipeDownGestureRecognizer:"))
        swipeDownGestureRecognizer.direction = .Down
        swipeDownGestureRecognizer.numberOfTouchesRequired = 2
        view.addGestureRecognizer(swipeDownGestureRecognizer)
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector: "theme", name: "theme", object: nil)
        
        theme()
    }
    
    public func theme() {
        view.backgroundColor = ThemeManager.sharedInstance.backgroundColor()
        containerView.scrollView.backgroundColor = ThemeManager.sharedInstance.containerColor()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override public func preferredStatusBarStyle() -> UIStatusBarStyle {
        return ThemeManager.sharedInstance.statusBarStyle()
    }
}

// MARK: - UIGestureRecognizerDelegate
extension MainViewController: UIGestureRecognizerDelegate {
    public func swipeUpGestureRecognizer(sender: UISwipeGestureRecognizer) {
        ThemeManager.sharedInstance.lightTheme()
    }
    
    public func swipeDownGestureRecognizer(sender: UISwipeGestureRecognizer) {
        ThemeManager.sharedInstance.darkTheme()
    }
    
    public func dismissGestureRecognizer(sender: AnyObject) {
        if containerView.popupVisible {
            containerView.dismiss()
        }
    }
}