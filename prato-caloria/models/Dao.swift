//
//  Dao.swift
//  prato-caloria
//
//  Created by Iury Vasconcelos on 11/07/2019.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import Foundation

class Dao {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func getURLMeals() -> URL {
        return getDocumentsDirectory().appendingPathComponent("api_pratos.dados")
    }
    
    func getURLItems() -> URL {
        return getDocumentsDirectory().appendingPathComponent("api_pratos_items.dados")
    }
    
    func save(_ meals:Array<Meal>) {
        do {
            let caminho = getURLMeals()
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: caminho)
        } catch {
            print("Couldn't write file")
        }
    }
    
    func load() -> Array<Meal> {
        do {
            let data = try Data(contentsOf: getURLMeals())
            if let meals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Meal> {
                return meals
            }
        } catch {
            print("Couldn't read file.")
        }
        return []
    }
    
    func save(_ items:Array<Item>) {
        do {
            let caminho = getURLItems()
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: caminho)
        } catch {
            print("Couldn't write file")
        }
    }
    
    func load() -> Array<Item> {
        do {
            let data = try Data(contentsOf: getURLItems())
            if let items = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Item> {
                return items
            }
        } catch {
            print("Couldn't read file.")
        }
        return []
    }
}
