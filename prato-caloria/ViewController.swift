//
//  ViewController.swift
//  prato-caloria
//
//  Created by Guest User on 02/07/19.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    
    @IBAction func add() {
        let name = nameField.text
        let happiness = happinessField.text
        print("eaten \(name) with \(happiness)!")
        
    }
}

