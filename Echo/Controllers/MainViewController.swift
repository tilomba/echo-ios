//
//  MainViewController.swift
//  Echo
//
//  Created by Douglas Bumby on 2015-04-05.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var translationContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        translationContainer.becomeFirstResponder()
    }
}

