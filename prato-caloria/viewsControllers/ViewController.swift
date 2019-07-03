//
//  ViewController.swift
//  prato-caloria
//
//  Created by Guest User on 02/07/19.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    
    @IBAction func add() {
        if (nameField == nil || happinessField == nil) {
            return
        }
        
        let name = nameField!.text!
        if let happiness = Int(happinessField!.text!) {
            let meal = Meal(name: name, happiness: happiness)
            print("eaten \(meal.name) with \(meal.happiness)!")
        }
    }
}

