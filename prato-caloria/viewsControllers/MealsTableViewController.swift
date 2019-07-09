//
//  MealsTableViewController.swift
//  prato-caloria
//
//  Created by Guest Iury Vasconcelos on 03/07/19.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import UIKit

class MealsTableViewController : UITableViewController, AddAMealDelegate {
    var meals = [Meal(name: "Eggplant Brownie", happiness: 5),
                 Meal(name: "Zucchini Muffin", happiness: 3)]
    
    func add(_ meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(recognizer)
        
        return cell
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer) {
        if(recognizer.state == UIGestureRecognizer.State.began) {
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                
                let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
                
                let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
                details.addAction(ok)
                
                present(details, animated: true, completion: nil)
            }
        }
    }
}
