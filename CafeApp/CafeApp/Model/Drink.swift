//
//  Drink.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/4/22.
//

import Foundation

struct Drink: MenuItem {
    
    var image: String
    var name: String
    var description: String
    var price: Double
    
    init(image: String, name: String, description: String, price: Double) {
        self.image = image
        self.name = name
        self.description = description
        self.price = price
    }
}
