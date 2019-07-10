//
//  RemoveMealController.swift
//  prato-caloria
//
//  Created by Iury Vasconcelos on 10/07/2019.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void) {
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        details.addAction(cancel)
        
        let remove = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: handler)
        details.addAction(remove)
        
        controller.present(details, animated: true, completion: nil)
    }
}
