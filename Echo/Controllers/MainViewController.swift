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

    let transition = PopAnimator()
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        translationContainer.scrollView.contentSize = translationContainer.bounds.size
        
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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "theme", name: "theme", object: nil)
        theme()
    }
    
    public func theme() {
        view.backgroundColor = ThemeManager.sharedInstance.backgroundColor()
        translationContainer.scrollView.backgroundColor = ThemeManager.sharedInstance.containerColor()
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

extension MainViewController: UIViewControllerTransitioningDelegate {
    @IBAction func showOptionsViewController(sender: UIButton) {
        let optionsViewController = storyboard!.instantiateViewControllerWithIdentifier("optionsViewController") as! OptionsViewController
        optionsViewController.transitioningDelegate = self
        presentViewController(optionsViewController, animated: true, completion: nil)
    }
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return transition
    }
}