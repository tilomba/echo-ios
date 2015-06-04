//
//  DummyTextField.swift
//  Echo
//
//  Created by Damon Jones on 4/28/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

public class DummyTextField: UITextField {
    
    @IBOutlet public weak var container: Container!
    
    override public func insertText(text: String) {
        super.insertText(text)
        
        container.doInsertText(text)
    }
    
    override public func deleteBackward() {
        super.deleteBackward()
        
        container.doDeleteBackwards()
    }
}
