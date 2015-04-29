//
//  DummyTextField.swift
//  Echo
//
//  Created by Damon Jones on 4/28/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class DummyTextField: UITextField {
    
    @IBOutlet weak var translationContainer: TranslationContainer!
    
    override func insertText(text: String) {
        super.insertText(text)
        
        translationContainer.doInsertText(text)
    }
    
    override func deleteBackward() {
        super.deleteBackward()
        
        translationContainer.doDeleteBackwards()
    }
}
