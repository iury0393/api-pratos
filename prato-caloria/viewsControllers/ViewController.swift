//
//  ViewController.swift
//  prato-caloria
//
//  Created by Guest User on 02/07/19.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {

    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    var delegate : AddAMealDelegate?
    var selected = Array<Item>()
    
    var items = Array<Item>()
    
    @IBOutlet var tableView : UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        Dao().save(items)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).show(message: "Unable to update items table")
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
        self.items = Dao().load()
    }
    
    @objc func showNewItem() {
        //let newItem = NewItemViewController(nibName: "NewItemViewController", bundle: nil)
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).show()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if(cell.accessoryType == UITableViewCell.AccessoryType.none) {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = items[indexPath.row]
                selected.append(item)
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = items[indexPath.row]
                if let position = selected.index(of: item) {
                    selected.remove(at: position)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    func convertToInt(_ text:String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    func getMealFromForm() -> Meal? {
        
        if let name = nameField?.text {
            if let happiness = convertToInt(happinessField?.text) {
                
                let meal = Meal(name: name, happiness: happiness, items: selected)
                
                print("eaten \(meal.name) with happiness \(meal.happiness) with \(meal.items)!")
                
                return meal
            }
        }
        
        return nil
    }
    
    
    
    @IBAction func add() {
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.add(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                } else {
                    Alert(controller: self).show(message: "Unable to go back, but the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show()
    }
    
}

