//
//  MenuItems.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/3/22.
//

import Foundation

protocol MenuItem {
    var image: String { get }
    var name: String { get }
    var description: String { get }
    var price: Double { get }
    
    init(image: String, name: String, description: String, price: Double)
}

struct MenuItems {
    let drinks = [
        Drink(image: "dripCoffee", name: "Drip Coffee", description: "Our daily house drip coffee", price: 2.00),
        Drink(image: "coldBrew", name: "Cold Brew", description: "Daily brewed cold brew", price: 3.00),
        Drink(image: "pourover", name: "Pourover", description: "A handmade cup of coffee using a V60", price: 4.50),
        Drink(image: "latte", name: "Latte", description: "Espresso with milk or milk alternatives", price: 5.00),
        Drink(image: "icedLatte", name: "Iced Latte", description: "Iced espresso with milk or milk alternatives", price: 5.00),
        Drink(image: "espresso", name: "Espresso", description: "A hand-pulled shot of our house espresso", price: 3.50),
        Drink(image: "tea", name: "Tea", description: "Tazo tea, hot or iced", price: 2.50),
    ]
    let food = [
        Food(image: "milk", name: "Milk", description: "A cup of milk of your choice", price: 2.00),
        Food(image: "croissant", name: "Croissant", description: "A crispy, buttery croissant", price: 4.00),
        Food(image: "donut", name: "Donut", description: "Our popular old fashion Donut", price: 3.50),
        Food(image: "sandwich", name: "Sandwich", description: "Ham, cheese, lettuce, tomato on sourdough", price: 5.50),
        Food(image: "gelato", name: "Gelato", description: "A scoop of our  housemade gelato", price: 3.50),
        Food(image: "cupcake", name: "Cupcake", description: "Moist cake with a layer of vanilla buttercream", price: 4.00),
        Food(image: "chocolateBar", name: "Chocolate Bar", description: "A bar of Ritter Sport", price: 3.50),
        Food(image: "pie", name: "Pie Slice", description: "Homeebaked Apple Pie Slice", price: 4.50),
        Food(image: "cookie", name: "Cookie", description: "One giant chocolate chip cookie with sea salt", price: 4.00),
    ]
    let other = [
        Other(image: "coffeeBeans", name: "Coffee Beans", description: "In-house roasted beans, whole or ground", price: 12.50),
        Other(image: "chemex", name: "Chemex", description: "To make pourovers at home", price: 20.00),
        Other(image: "coffeeFilters", name: "Coffee Filters", description: "Chemex filters, packs of 100", price: 6.50),
        Other(image: "coffeeGrinder", name: "Hand Grinder", description: "Kalita hand grinder", price: 15.50),
        Other(image: "newspaper", name: "Newspaper", description: "Daily Newspaper", price: 3.50),
    ]
}
