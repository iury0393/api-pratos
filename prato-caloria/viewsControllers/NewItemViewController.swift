//
//  NewItemViewController.swift
//  prato-caloria
//
//  Created by Iury Vasconcelos on 08/07/2019.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    var delegate:AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var calorieField: UITextField?
    
    @IBAction func addNewItem() {
        let name = nameField!.text
        let calories = Double(calorieField!.text!)
        
        if(name == nil || calories == nil || delegate == nil) {
            return
        }
        
        let item = Item(name: name!, calories: calories!)
        delegate!.add(item)
        
        print("adding new item")
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

}
