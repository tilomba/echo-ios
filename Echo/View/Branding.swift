//
//  Branding.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-19.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.

import UIKit

public class Branding : NSObject {
    private struct Cache {
        static var imageOfBranding: UIImage?
        static var canvasTargets: [AnyObject]?
    }
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "theme", name: "theme", object: nil)
    }
    
    func theme() {
        canvasTargets[0].setImage(Branding.imageOfBranding)
    }
    
    public class func drawCanvas1() {

        let context = UIGraphicsGetCurrentContext()
        let fillColor = ThemeManager.sharedInstance.containerColor()

        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)

        var clipPath = UIBezierPath()
        clipPath.moveToPoint(CGPointMake(37.99, 0.68))
        clipPath.addCurveToPoint(CGPointMake(67.21, 6.43), controlPoint1: CGPointMake(48.01, -0.73), controlPoint2: CGPointMake(58.52, 1.17))
        clipPath.addCurveToPoint(CGPointMake(72.13, 10.15), controlPoint1: CGPointMake(68.94, 7.52), controlPoint2: CGPointMake(70.81, 8.54))
        clipPath.addCurveToPoint(CGPointMake(69.68, 14.43), controlPoint1: CGPointMake(73.4, 11.87), controlPoint2: CGPointMake(71.82, 14.67))
        clipPath.addCurveToPoint(CGPointMake(65.69, 12.28), controlPoint1: CGPointMake(68.15, 14.22), controlPoint2: CGPointMake(66.98, 13.05))
        clipPath.addCurveToPoint(CGPointMake(27.15, 10.01), controlPoint1: CGPointMake(54.51, 4.64), controlPoint2: CGPointMake(39.18, 3.83))
        clipPath.addCurveToPoint(CGPointMake(20.72, 13.96), controlPoint1: CGPointMake(24.87, 11.09), controlPoint2: CGPointMake(22.88, 12.67))
        clipPath.addCurveToPoint(CGPointMake(16.85, 13.14), controlPoint1: CGPointMake(19.5, 14.78), controlPoint2: CGPointMake(17.55, 14.53))
        clipPath.addCurveToPoint(CGPointMake(17.76, 9.19), controlPoint1: CGPointMake(15.99, 11.83), controlPoint2: CGPointMake(16.46, 10.03))
        clipPath.addCurveToPoint(CGPointMake(37.99, 0.68), controlPoint1: CGPointMake(23.59, 4.64), controlPoint2: CGPointMake(30.68, 1.77))
        clipPath.addLineToPoint(CGPointMake(37.99, 0.68))
        clipPath.closePath()
        clipPath.usesEvenOddFillRule = true
        clipPath.addClip()

        let rectanglePath = UIBezierPath(rect: CGRectMake(11.42, -4.75, 66.15, 24.2))
        fillColor.setFill()
        rectanglePath.fill()

        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)

        // First Bezier Path
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(38.62, 11.77))
        bezierPath.addCurveToPoint(CGPointMake(62.58, 16.59), controlPoint1: CGPointMake(46.83, 10.39), controlPoint2: CGPointMake(55.62, 11.93))
        bezierPath.addCurveToPoint(CGPointMake(64.21, 19.31), controlPoint1: CGPointMake(63.49, 17.18), controlPoint2: CGPointMake(64.34, 18.13))
        bezierPath.addCurveToPoint(CGPointMake(60.6, 21.87), controlPoint1: CGPointMake(64.38, 21.09), controlPoint2: CGPointMake(62.22, 22.58))
        bezierPath.addCurveToPoint(CGPointMake(55.57, 19.27), controlPoint1: CGPointMake(58.86, 21.15), controlPoint2: CGPointMake(57.3, 20.02))
        bezierPath.addCurveToPoint(CGPointMake(33, 19.47), controlPoint1: CGPointMake(48.49, 16.12), controlPoint2: CGPointMake(40.03, 16.17))
        bezierPath.addCurveToPoint(CGPointMake(28.4, 21.87), controlPoint1: CGPointMake(31.43, 20.19), controlPoint2: CGPointMake(30, 21.21))
        bezierPath.addCurveToPoint(CGPointMake(24.79, 19.31), controlPoint1: CGPointMake(26.78, 22.58), controlPoint2: CGPointMake(24.61, 21.09))
        bezierPath.addCurveToPoint(CGPointMake(26.78, 16.34), controlPoint1: CGPointMake(24.63, 17.95), controlPoint2: CGPointMake(25.75, 16.99))
        bezierPath.addCurveToPoint(CGPointMake(38.62, 11.77), controlPoint1: CGPointMake(30.38, 14.05), controlPoint2: CGPointMake(34.43, 12.51))
        bezierPath.addLineToPoint(CGPointMake(38.62, 11.77))
        bezierPath.closePath()
        bezierPath.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath.fill()

        // Second Bezier Path
        var bezierPath2 = UIBezierPath()
        bezierPath2.moveToPoint(CGPointMake(11.58, 18.36))
        bezierPath2.addCurveToPoint(CGPointMake(21.5, 24.48), controlPoint1: CGPointMake(15.82, 17.35), controlPoint2: CGPointMake(20.58, 20.17))
        bezierPath2.addCurveToPoint(CGPointMake(20.08, 31.78), controlPoint1: CGPointMake(22.26, 27), controlPoint2: CGPointMake(21.29, 29.58))
        bezierPath2.addCurveToPoint(CGPointMake(17.83, 51.51), controlPoint1: CGPointMake(16.87, 37.76), controlPoint2: CGPointMake(16.15, 44.95))
        bezierPath2.addCurveToPoint(CGPointMake(19.59, 54.79), controlPoint1: CGPointMake(18.16, 52.7), controlPoint2: CGPointMake(18.5, 54.05))
        bezierPath2.addCurveToPoint(CGPointMake(23.57, 52.99), controlPoint1: CGPointMake(21.06, 55.83), controlPoint2: CGPointMake(23.34, 54.74))
        bezierPath2.addCurveToPoint(CGPointMake(23.04, 50.01), controlPoint1: CGPointMake(23.55, 51.97), controlPoint2: CGPointMake(23.25, 51))
        bezierPath2.addCurveToPoint(CGPointMake(25.35, 33.35), controlPoint1: CGPointMake(21.65, 44.46), controlPoint2: CGPointMake(22.29, 38.26))
        bezierPath2.addCurveToPoint(CGPointMake(30.52, 34.68), controlPoint1: CGPointMake(26.48, 30.96), controlPoint2: CGPointMake(30.76, 31.97))
        bezierPath2.addCurveToPoint(CGPointMake(28.1, 42.72), controlPoint1: CGPointMake(29.98, 37.43), controlPoint2: CGPointMake(28.24, 39.86))
        bezierPath2.addCurveToPoint(CGPointMake(29.16, 51.28), controlPoint1: CGPointMake(27.7, 45.63), controlPoint2: CGPointMake(28.56, 48.47))
        bezierPath2.addCurveToPoint(CGPointMake(22.39, 60.72), controlPoint1: CGPointMake(30.04, 55.58), controlPoint2: CGPointMake(26.72, 60.13))
        bezierPath2.addCurveToPoint(CGPointMake(12.98, 55.14), controlPoint1: CGPointMake(18.41, 61.54), controlPoint2: CGPointMake(14.19, 58.99))
        bezierPath2.addCurveToPoint(CGPointMake(15.04, 29.14), controlPoint1: CGPointMake(10.18, 46.68), controlPoint2: CGPointMake(10.8, 37.02))
        bezierPath2.addCurveToPoint(CGPointMake(15.54, 24.99), controlPoint1: CGPointMake(15.64, 27.88), controlPoint2: CGPointMake(16.66, 26.29))
        bezierPath2.addCurveToPoint(CGPointMake(11.11, 25.2), controlPoint1: CGPointMake(14.54, 23.39), controlPoint2: CGPointMake(11.98, 23.55))
        bezierPath2.addCurveToPoint(CGPointMake(10.25, 62.22), controlPoint1: CGPointMake(4.47, 36.27), controlPoint2: CGPointMake(4.14, 50.84))
        bezierPath2.addCurveToPoint(CGPointMake(11.01, 66.82), controlPoint1: CGPointMake(10.88, 63.6), controlPoint2: CGPointMake(12.05, 65.34))
        bezierPath2.addCurveToPoint(CGPointMake(5.97, 66.41), controlPoint1: CGPointMake(9.84, 68.65), controlPoint2: CGPointMake(6.83, 68.41))
        bezierPath2.addCurveToPoint(CGPointMake(5.98, 22.56), controlPoint1: CGPointMake(-1.7, 53.14), controlPoint2: CGPointMake(-1.67, 35.82))
        bezierPath2.addCurveToPoint(CGPointMake(11.58, 18.36), controlPoint1: CGPointMake(7.17, 20.47), controlPoint2: CGPointMake(9.19, 18.82))
        bezierPath2.addLineToPoint(CGPointMake(11.58, 18.36))
        bezierPath2.closePath()
        bezierPath2.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath2.fill()

        // Third Bezier Path
        var bezierPath3 = UIBezierPath()
        bezierPath3.moveToPoint(CGPointMake(74.2, 18.3))
        bezierPath3.addCurveToPoint(CGPointMake(81.98, 21.1), controlPoint1: CGPointMake(77.05, 17.79), controlPoint2: CGPointMake(80.15, 18.84))
        bezierPath3.addCurveToPoint(CGPointMake(85.26, 27.08), controlPoint1: CGPointMake(83.42, 22.88), controlPoint2: CGPointMake(84.35, 25))
        bezierPath3.addCurveToPoint(CGPointMake(83.04, 66.41), controlPoint1: CGPointMake(90.61, 39.59), controlPoint2: CGPointMake(89.83, 54.6))
        bezierPath3.addCurveToPoint(CGPointMake(77.99, 66.82), controlPoint1: CGPointMake(82.17, 68.41), controlPoint2: CGPointMake(79.15, 68.65))
        bezierPath3.addCurveToPoint(CGPointMake(78.76, 62.22), controlPoint1: CGPointMake(76.94, 65.33), controlPoint2: CGPointMake(78.11, 63.6))
        bezierPath3.addCurveToPoint(CGPointMake(77.89, 25.19), controlPoint1: CGPointMake(84.84, 50.84), controlPoint2: CGPointMake(84.53, 36.26))
        bezierPath3.addCurveToPoint(CGPointMake(72.95, 26.68), controlPoint1: CGPointMake(76.66, 22.75), controlPoint2: CGPointMake(72.66, 24.03))
        bezierPath3.addCurveToPoint(CGPointMake(76.01, 33.85), controlPoint1: CGPointMake(73.73, 29.16), controlPoint2: CGPointMake(75.25, 31.35))
        bezierPath3.addCurveToPoint(CGPointMake(76.02, 55.14), controlPoint1: CGPointMake(78.28, 40.69), controlPoint2: CGPointMake(78.29, 48.3))
        bezierPath3.addCurveToPoint(CGPointMake(66.61, 60.72), controlPoint1: CGPointMake(74.81, 58.99), controlPoint2: CGPointMake(70.59, 61.54))
        bezierPath3.addCurveToPoint(CGPointMake(59.94, 50.71), controlPoint1: CGPointMake(62.06, 60.14), controlPoint2: CGPointMake(58.72, 55.15))
        bezierPath3.addCurveToPoint(CGPointMake(60.55, 40.72), controlPoint1: CGPointMake(60.8, 47.47), controlPoint2: CGPointMake(61.44, 44.03))
        bezierPath3.addCurveToPoint(CGPointMake(58.48, 34.69), controlPoint1: CGPointMake(60.06, 38.64), controlPoint2: CGPointMake(58.83, 36.79))
        bezierPath3.addCurveToPoint(CGPointMake(63.65, 33.35), controlPoint1: CGPointMake(58.24, 31.97), controlPoint2: CGPointMake(62.52, 30.96))
        bezierPath3.addCurveToPoint(CGPointMake(65.85, 50.51), controlPoint1: CGPointMake(66.8, 38.41), controlPoint2: CGPointMake(67.36, 44.81))
        bezierPath3.addCurveToPoint(CGPointMake(66.41, 54.6), controlPoint1: CGPointMake(65.5, 51.86), controlPoint2: CGPointMake(64.99, 53.65))
        bezierPath3.addCurveToPoint(CGPointMake(70.75, 52.89), controlPoint1: CGPointMake(67.96, 55.98), controlPoint2: CGPointMake(70.34, 54.76))
        bezierPath3.addCurveToPoint(CGPointMake(69.12, 32.19), controlPoint1: CGPointMake(72.92, 46.15), controlPoint2: CGPointMake(72.37, 38.51))
        bezierPath3.addCurveToPoint(CGPointMake(67.39, 24.98), controlPoint1: CGPointMake(67.97, 29.99), controlPoint2: CGPointMake(66.75, 27.54))
        bezierPath3.addCurveToPoint(CGPointMake(74.2, 18.3), controlPoint1: CGPointMake(67.93, 21.59), controlPoint2: CGPointMake(70.83, 18.82))
        bezierPath3.addLineToPoint(CGPointMake(74.2, 18.3))
        bezierPath3.closePath()
        bezierPath3.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath3.fill()

        // Fourth Bezier Path
        var bezierPath4 = UIBezierPath()
        bezierPath4.moveToPoint(CGPointMake(40.43, 22.67))
        bezierPath4.addCurveToPoint(CGPointMake(55.96, 25.66), controlPoint1: CGPointMake(45.7, 21.86), controlPoint2: CGPointMake(51.54, 22.47))
        bezierPath4.addCurveToPoint(CGPointMake(53.77, 30.39), controlPoint1: CGPointMake(58.21, 27.14), controlPoint2: CGPointMake(56.42, 31.22))
        bezierPath4.addCurveToPoint(CGPointMake(42.71, 28.1), controlPoint1: CGPointMake(50.22, 29.12), controlPoint2: CGPointMake(46.61, 27.46))
        bezierPath4.addCurveToPoint(CGPointMake(34.7, 30.45), controlPoint1: CGPointMake(39.86, 28.23), controlPoint2: CGPointMake(37.45, 29.99))
        bezierPath4.addCurveToPoint(CGPointMake(32.7, 25.98), controlPoint1: CGPointMake(32.49, 30.72), controlPoint2: CGPointMake(31.06, 27.45))
        bezierPath4.addCurveToPoint(CGPointMake(40.43, 22.67), controlPoint1: CGPointMake(34.8, 24.05), controlPoint2: CGPointMake(37.69, 23.25))
        bezierPath4.addLineToPoint(CGPointMake(40.43, 22.67))
        bezierPath4.closePath()
        bezierPath4.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath4.fill()

        // Fifth Bezier Path
        var bezierPath5 = UIBezierPath()
        bezierPath5.moveToPoint(CGPointMake(51.01, 88.32))
        bezierPath5.addCurveToPoint(CGPointMake(21.79, 82.57), controlPoint1: CGPointMake(40.99, 89.73), controlPoint2: CGPointMake(30.48, 87.83))
        bezierPath5.addCurveToPoint(CGPointMake(16.87, 78.85), controlPoint1: CGPointMake(20.06, 81.48), controlPoint2: CGPointMake(18.19, 80.46))
        bezierPath5.addCurveToPoint(CGPointMake(19.32, 74.57), controlPoint1: CGPointMake(15.6, 77.13), controlPoint2: CGPointMake(17.18, 74.33))
        bezierPath5.addCurveToPoint(CGPointMake(23.31, 76.72), controlPoint1: CGPointMake(20.85, 74.78), controlPoint2: CGPointMake(22.02, 75.95))
        bezierPath5.addCurveToPoint(CGPointMake(61.85, 78.99), controlPoint1: CGPointMake(34.49, 84.36), controlPoint2: CGPointMake(49.82, 85.17))
        bezierPath5.addCurveToPoint(CGPointMake(68.28, 75.04), controlPoint1: CGPointMake(64.13, 77.91), controlPoint2: CGPointMake(66.12, 76.33))
        bezierPath5.addCurveToPoint(CGPointMake(72.15, 75.86), controlPoint1: CGPointMake(69.5, 74.22), controlPoint2: CGPointMake(71.45, 74.47))
        bezierPath5.addCurveToPoint(CGPointMake(71.24, 79.81), controlPoint1: CGPointMake(73.01, 77.17), controlPoint2: CGPointMake(72.54, 78.97))
        bezierPath5.addCurveToPoint(CGPointMake(51.01, 88.32), controlPoint1: CGPointMake(65.41, 84.36), controlPoint2: CGPointMake(58.32, 87.23))
        bezierPath5.addLineToPoint(CGPointMake(51.01, 88.32))
        bezierPath5.closePath()
        bezierPath5.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath5.fill()

        // Sixth Bezier Path
        var bezierPath6 = UIBezierPath()
        bezierPath6.moveToPoint(CGPointMake(50.38, 77.23))
        bezierPath6.addCurveToPoint(CGPointMake(26.42, 72.41), controlPoint1: CGPointMake(42.17, 78.61), controlPoint2: CGPointMake(33.38, 77.07))
        bezierPath6.addCurveToPoint(CGPointMake(24.79, 69.69), controlPoint1: CGPointMake(25.51, 71.82), controlPoint2: CGPointMake(24.66, 70.87))
        bezierPath6.addCurveToPoint(CGPointMake(28.4, 67.13), controlPoint1: CGPointMake(24.62, 67.91), controlPoint2: CGPointMake(26.78, 66.42))
        bezierPath6.addCurveToPoint(CGPointMake(33.43, 69.73), controlPoint1: CGPointMake(30.14, 67.85), controlPoint2: CGPointMake(31.7, 68.98))
        bezierPath6.addCurveToPoint(CGPointMake(56, 69.53), controlPoint1: CGPointMake(40.51, 72.88), controlPoint2: CGPointMake(48.97, 72.83))
        bezierPath6.addCurveToPoint(CGPointMake(60.6, 67.13), controlPoint1: CGPointMake(57.57, 68.81), controlPoint2: CGPointMake(59, 67.79))
        bezierPath6.addCurveToPoint(CGPointMake(64.21, 69.69), controlPoint1: CGPointMake(62.22, 66.42), controlPoint2: CGPointMake(64.39, 67.91))
        bezierPath6.addCurveToPoint(CGPointMake(62.22, 72.66), controlPoint1: CGPointMake(64.37, 71.05), controlPoint2: CGPointMake(63.25, 72.01))
        bezierPath6.addCurveToPoint(CGPointMake(50.38, 77.23), controlPoint1: CGPointMake(58.62, 74.95), controlPoint2: CGPointMake(54.57, 76.49))
        bezierPath6.addLineToPoint(CGPointMake(50.38, 77.23))
        bezierPath6.closePath()
        bezierPath6.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath6.fill()

        // Seventh Bezier Path
        var bezierPath7 = UIBezierPath()
        bezierPath7.moveToPoint(CGPointMake(48.57, 66.33))
        bezierPath7.addCurveToPoint(CGPointMake(33.04, 63.34), controlPoint1: CGPointMake(43.3, 67.14), controlPoint2: CGPointMake(37.46, 66.53))
        bezierPath7.addCurveToPoint(CGPointMake(35.23, 58.61), controlPoint1: CGPointMake(30.79, 61.86), controlPoint2: CGPointMake(32.58, 57.78))
        bezierPath7.addCurveToPoint(CGPointMake(46.29, 60.9), controlPoint1: CGPointMake(38.78, 59.88), controlPoint2: CGPointMake(42.39, 61.54))
        bezierPath7.addCurveToPoint(CGPointMake(54.3, 58.55), controlPoint1: CGPointMake(49.14, 60.77), controlPoint2: CGPointMake(51.55, 59.01))
        bezierPath7.addCurveToPoint(CGPointMake(56.3, 63.02), controlPoint1: CGPointMake(56.51, 58.28), controlPoint2: CGPointMake(57.94, 61.55))
        bezierPath7.addCurveToPoint(CGPointMake(48.57, 66.33), controlPoint1: CGPointMake(54.2, 64.95), controlPoint2: CGPointMake(51.31, 65.75))
        bezierPath7.addLineToPoint(CGPointMake(48.57, 66.33))
        bezierPath7.closePath()
        bezierPath7.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath7.fill()
    }

    public class var imageOfBranding: UIImage {
//        if Cache.imageOfBranding != nil {
//            return Cache.imageOfBranding!
//        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(89, 89), false, 0)
        Branding.drawCanvas1()

        Cache.imageOfBranding = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return Cache.imageOfBranding!
    }

    @IBOutlet var canvasTargets: [AnyObject]! {
        get { return Cache.canvasTargets }
        set {
            Cache.canvasTargets = newValue
            for target: AnyObject in newValue {
                target.setImage(Branding.imageOfBranding)
            }
        }
    }
}

@objc protocol StyleKitSettableImage {
    func setImage(image: UIImage!)
}

@objc protocol StyleKitSettableSelectedImage {
    func setSelectedImage(image: UIImage!)
}
