//
//  Item.swift
//  prato-caloria
//
//  Created by Iury Vasconcelos on 03/07/19.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import Foundation

class Item : Equatable {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories;
    }
}

func ==(first:Item, second:Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}
