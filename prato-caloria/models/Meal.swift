//
//  Meal.swift
//  prato-caloria
//
//  Created by Iury Vasconcelos on 03/07/19.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import Foundation

class Meal {
    let name:String
    let happiness:Int
    let items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
}
