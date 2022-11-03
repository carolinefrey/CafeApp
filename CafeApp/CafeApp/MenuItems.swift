//
//  MenuItems.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/3/22.
//

import Foundation

class MenuItem {
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

class Menu {
    let menuArray: [MenuItem] = [
        MenuItem(image: "dripCoffee", name: "Drip Coffee", description: "Our daily house drip coffee", price: 2.00),
        MenuItem(image: "coldBrew", name: "Cold Brew", description: "Daily brewed cold brew", price: 3.00),
        MenuItem(image: "pourover", name: "Pourover", description: "A handmade cup of coffee using a V60", price: 4.50),
        MenuItem(image: "latte", name: "Latte", description: "Espresso with milk or milk alternatives", price: 5.00),
        MenuItem(image: "icedLatte", name: "Iced Latte", description: "Iced espresso with milk or milk alternatives", price: 5.00),
        MenuItem(image: "espresso", name: "Espresso", description: "A hand-pulled shot of our house espresso", price: 3.50),
        MenuItem(image: "tea", name: "Tea", description: "Tazo tea, hot or iced", price: 2.50),
        MenuItem(image: "milk", name: "Milk", description: "A cup of milk of your choice", price: 2.00),
        MenuItem(image: "croissant", name: "Croissant", description: "A crispy, buttery croissant", price: 4.00),
        MenuItem(image: "donut", name: "Donut", description: "Our popular old fashion Donut", price: 3.50),
        MenuItem(image: "sandwich", name: "Sandwich", description: "Ham, cheese, lettuce, tomato on sourdough", price: 5.50),
        MenuItem(image: "gelato", name: "Gelato", description: "A scoop of our  housemade gelato", price: 3.50),
        MenuItem(image: "cupcake", name: "Cupcake", description: "Moist cake with a layer of vanilla buttercream", price: 4.00),
        MenuItem(image: "chocolateBar", name: "Chocolate Bar", description: "A bar of Ritter Sport", price: 3.50),
        MenuItem(image: "pie", name: "Pie Slice", description: "Homeebaked Apple Pie Slice", price: 4.50),
        MenuItem(image: "cookie", name: "Cookie", description: "One giant chocolate chip cookie with sea salt", price: 4.00),
        MenuItem(image: "coffeeBeans", name: "Coffee Beans", description: "In-house roasted beans, whole or ground", price: 12.50),
        MenuItem(image: "chemex", name: "Chemex", description: "To make pourovers at home", price: 20.00),
        MenuItem(image: "coffeeFilters", name: "Coffee Filters", description: "Chemex filters, packs of 100", price: 6.50),
        MenuItem(image: "coffeeGrinder", name: "Hand Grinder", description: "Kalita hand grinder", price: 15.50),
        MenuItem(image: "newspaper", name: "Newspaper", description: "Daily Newspaper", price: 3.50),
    ]
}
