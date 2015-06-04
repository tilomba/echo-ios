//
//  TranslationContainer.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-19.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

public class TranslationContainer: UIView, UIGestureRecognizerDelegate {
    
    private struct Constants {
        static let spacing: CGFloat = 10.0
        static let xStartPosition: CGFloat = 10.0
        static let yStartPosition: CGFloat = 13.0
        static let popupRect = CGRect(x: 0.0, y: 0.0, width: 299.0, height: 93.0)
    }
    
    private var insertPoint = CGPoint(x: Constants.xStartPosition + TokenView.Constants.xMargin,
                                      y: Constants.yStartPosition + TokenView.Constants.yMargin)
    
    private var ActionView: ActionView?
    private var editingActive = true
    public var popupVisible = false
    @IBOutlet weak var textField: DummyTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    private var tokenViews = [TokenView]()
    
    // MARK: Object life cycle
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector: "theme", name: "theme", object: nil)
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector: "pasteTokens:", name: "paste", object: nil)
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector: "clearTokensFromView:", name: "clear", object: nil)
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector: "copyTokens:", name: "copy", object: nil)
    }

    deinit {
        NSNotificationCenter
            .defaultCenter()
            .removeObserver(self, name: "theme", object: nil)
        
        NSNotificationCenter
            .defaultCenter()
            .removeObserver(self, name: "paste", object: nil)
        
        NSNotificationCenter
            .defaultCenter()
            .removeObserver(self, name: "clear", object: nil)
        
        NSNotificationCenter
            .defaultCenter()
            .removeObserver(self, name: "copy", object: nil)
    }
    
    public override func awakeFromNib() {
        theme()
    }
    
    // MARK: theme
    public func theme() {
        textField.resignFirstResponder()
        textField.keyboardAppearance = ThemeManager.sharedInstance.keyboardStyle()
        textField.becomeFirstResponder()
        
        if let ActionView = ActionView {
            ActionView.removeFromSuperview()
        }
        
        ActionView = ActionView(frame: Constants.popupRect)
        
        if popupVisible {
            addSubview(ActionView!)
            ActionView!.center = CGPoint(x: bounds.midX, y: bounds.midY)
            ActionView!.layer.zPosition = 100
        }
    }

    func doInsertText(text: String) {
        insertText(text)
    }
    
    func doDeleteBackwards() {
        deleteBackward()
    }
        
    // UIKeyInput
    public func insertText(text: String) {
        if !editingActive {
            return
        }
        
        let newTokens = NATODictionary.translateString(text)
        draw(newTokens)
    }

    public func deleteBackward() {
        if !editingActive {
            return
        }
        
        if tokenViews.isEmpty {
            return
        }
        
        let tokenViewToRemove = tokenViews.removeLast()
        moveInsertPointAfterTokenView(tokenViewToRemove)
        
        UIView.animateWithDuration(0.15, animations: {
            tokenViewToRemove.center = self.convertPoint(CGPoint(x: self.scrollView.bounds.midX, y: self.scrollView.bounds.midY), fromView: self.scrollView)
        }) { (completed) -> Void in
            tokenViewToRemove.removeFromSuperview()
        }
    }
    
    // MARK: Editing methods
    private func draw(newTokens: TokenList, fromPaste: Bool = false) {
        for token in newTokens {
            let tokenView = TokenView(frame: CGRectZero)
            tokenView.token = token
            
            // check if the insertion point needs to be moved down a line because it's too wide to fit on the current line
            adjustInsertPointForTokenView(tokenView)
            
            tokenViews.append(tokenView)
            addSubview(tokenView)
            
            let position = CGPoint(x: tokenView.bounds.midX + insertPoint.x, y: tokenView.bounds.midY + insertPoint.y)
            tokenView.center = position
            
            if !fromPaste {
                tokenView.center = CGPoint(x: bounds.midX, y: bounds.maxY + 75.0)
            
                UIView.animateWithDuration(0.15) {
                    tokenView.center = position
                }
            }
            
            moveInsertPoint(tokenView.bounds.size)
        }
        
        if fromPaste {
            for tokenView in tokenViews {
                let position = tokenView.center
                tokenView.center = ActionView!.center
                
                UIView.animateWithDuration(0.15, animations: {
                    tokenView.center = position
                }, completion: { (completed) -> Void in
                    if tokenView == self.tokenViews.last {
                        self.dismiss()
                    }
                })
            }
        }
    }
    
    private func clearTokens() {
        for tokenView in tokenViews {
            tokenView.removeFromSuperview()
        }
        
        tokenViews.removeAll()
        
        resetInsertPoint()
    }
    
    private func moveInsertPointAfterTokenView(tokenView: TokenView) {
        let oldInsertPoint = insertPoint
        
        insertPoint.y = tokenView.center.y - tokenView.bounds.midY
        insertPoint.x = tokenView.center.x - tokenView.bounds.midX
        if insertPoint.x >= bounds.maxX {
            moveDownALine(tokenView.bounds.size.height)
        }

        let lineHeight = tokenView.bounds.size.height + Constants.spacing
        let yDelta = oldInsertPoint.y - insertPoint.y

        scrollView.contentSize.height -= yDelta
        if scrollView.contentSize.height < scrollView.bounds.size.height {
           scrollView.contentSize.height = scrollView.bounds.size.height
        }
        
        ensureInsertPointIsVisible(tokenView.bounds.size.height)
    }
    
    private func moveInsertPoint(tokenSize: CGSize) {
        insertPoint.x += tokenSize.width + Constants.spacing
        if insertPoint.x >= bounds.maxX {
            moveDownALine(tokenSize.height)
        }
        ensureInsertPointIsVisible(tokenSize.height)
    }
    
    private func moveDownALine(height: CGFloat) {
        let lineHeight = height + Constants.spacing
        
        insertPoint.x = Constants.xStartPosition + TokenView.Constants.xMargin
        insertPoint.y += lineHeight
        
        if insertPoint.y >= bounds.maxY {
            scrollView.contentSize.height += lineHeight
        }
    }
    
    private func adjustInsertPointForTokenView(tokenView: TokenView) {
        if insertPoint.x + tokenView.bounds.size.width >= bounds.maxX {
            moveDownALine(tokenView.bounds.size.height)
        }
    }
    
    private func resetInsertPoint() {
        insertPoint = CGPoint(x: Constants.xStartPosition + TokenView.Constants.xMargin, y: Constants.yStartPosition + TokenView.Constants.yMargin)
    }
    
    private func ensureInsertPointIsVisible(tokenHeight: CGFloat) {
        if insertPoint.y > scrollView.bounds.height {
            let newOffset = CGPoint(x: scrollView.contentOffset.x, y: insertPoint.y - scrollView.bounds.height + Constants.spacing + tokenHeight)
            scrollView.setContentOffset(newOffset, animated: true)
        }
    }
    
    // MARK: Popup methods
    @IBAction func longPressGestureRecognizer(sender: AnyObject) {
        if popupVisible {
            return
        }
        
        if sender.state == UIGestureRecognizerState.Began {
            if nil == ActionView {
                ActionView = ActionView(frame: Constants.popupRect)
            }
            
            addSubview(ActionView!)
            ActionView!.center = CGPoint(x: bounds.midX, y: bounds.midY)
            ActionView!.layer.zPosition = 100
            
            editingActive = false
            popupVisible = true
            
            let finalRect = ActionView!.bounds
            ActionView!.bounds = CGRectZero
            UIView.animateWithDuration(0.15) {
                self.ActionView!.bounds = finalRect
            }
        }
    }
    
    public func dismiss() {
        if popupVisible {
            UIView.animateWithDuration(0.15, animations: {
                self.ActionView!.bounds = CGRectZero
            }, completion: { (completed) -> Void in
                self.ActionView!.removeFromSuperview()
                self.ActionView!.bounds = Constants.popupRect
                self.popupVisible = false
                self.editingActive = true
            })
        }
    }
    
    // MARK: Notification methods
    public func pasteTokens(sender: AnyObject) {
        if let pasteboardString = UIPasteboard.generalPasteboard().string {
            clearTokens()
            draw(NATODictionary.translateString(pasteboardString), fromPaste: true)
        } else {
            dismiss()
        }
    }
    
    public func clearTokensFromView(sender: AnyObject) {
        clearTokens()
        dismiss()
    }
    
    public func copyTokens(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = tokenViews.map { $0.token!.rawValue }.reduce("", combine: { $0! + " " + $1 })
        dismiss()
    }
}
