//
//  PopAnimator.swift
//  Echo
//
//  Created by Damon Jones on 4/23/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration = 0.75
    var presenting = true
    var originFrame = CGRectZero
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!

//        let newView = presenting ? toView : transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
//        let initialFrame = presenting ? originFrame : newView.frame
//        let finalFrame = presenting ? CGRect(x: (containerView.bounds.size.width - 250.0) / 2.0, y: 50.0, width: 250.0, height: 200.0) : originFrame
//        let xScaleFactor = presenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
//        let yScaleFactor = presenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        
//        let scaleTransform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor)
//        if presenting {
//            newView.transform = scaleTransform
//            newView.center = CGPoint(x: CGRectGetMidX(initialFrame), y: CGRectGetMidY(initialFrame))
//            newView.clipsToBounds = true
//        }
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(toView)
        
        UIView.animateWithDuration(duration, delay:0.0, usingSpringWithDamping:0.5, initialSpringVelocity:0.0, options:nil, animations: {
//            toView.transform = self.presenting ? CGAffineTransformIdentity : CGAffineTransformIdentity
    toView.bounds.size = CGSize(width: 300.0, height: 200.0)
            toView.center = CGPoint(x: CGRectGetMidX(fromView.bounds), y: 120.0)
        }, completion:{_ in
            transitionContext.completeTransition(true)
        })
    }
}
