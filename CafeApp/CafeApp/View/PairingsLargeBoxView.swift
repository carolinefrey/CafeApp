//
//  PairingsLargeBoxView.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/5/22.
//

import UIKit

class PairingsLargeBoxView: UIView {
    
    //MARK: - UI Properties
    let selectedItem: MenuItem
    var selectedItemType: String
    let fullMenu = MenuItems()
    
    lazy var suggestedPairings = configurePairings()
    
    let pairingsLargeBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color4")
        box.clipsToBounds = true
        box.layer.cornerRadius = 10
        return box
    }()
    
    let pairingsTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Inter-ExtraLight", size: 16)
        title.textColor = .black
        title.textAlignment = .center
        
        let attributedString = NSMutableAttributedString(string: "pairings")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 12, range: NSRange(location: 0, length: attributedString.length))
        title.attributedText = attributedString
        return title
    }()
    
    lazy var first: PairingsDetailBoxView = {
        let first = PairingsDetailBoxView(item: suggestedPairings[0])
        first.translatesAutoresizingMaskIntoConstraints = false
        first.heightAnchor.constraint(equalToConstant: 116).isActive = true
        first.widthAnchor.constraint(equalToConstant: 96).isActive = true
        return first
    }()
    
    lazy var second: PairingsDetailBoxView = {
        let second = PairingsDetailBoxView(item: suggestedPairings[1])
        second.translatesAutoresizingMaskIntoConstraints = false
        second.heightAnchor.constraint(equalToConstant: 116).isActive = true
        second.widthAnchor.constraint(equalToConstant: 96).isActive = true
        return second
    }()
    
    lazy var third: PairingsDetailBoxView = {
        let third = PairingsDetailBoxView(item: suggestedPairings[2])
        third.translatesAutoresizingMaskIntoConstraints = false
        third.heightAnchor.constraint(equalToConstant: 116).isActive = true
        third.widthAnchor.constraint(equalToConstant: 96).isActive = true
        return third
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 15
        return stack
    }()
    
    //MARK: - Initializers
    
    init(selectedItem: MenuItem, type: String) {
        self.selectedItem = selectedItem
        self.selectedItemType = type
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    private func configurePairings() -> [MenuItem] {
        switch selectedItemType {
        case "drink":
            return [
                Food(image: "cupcake", name: "Cupcake", description: "sample", price: 4.00), //dummy data
                Food(image: "pie", name: "Pie", description: "sample", price: 4.00), //dummy data
                Food(image: "gelato", name: "Gelato", description: "sample", price: 4.00) //dummy data
            ]
        case "food":
            return [
                Drink(image: "latte", name: "Latte", description: "sample", price: 3.00), //dummy data
                Drink(image: "espresso", name: "Espresso", description: "sample", price: 3.00), //dummy data
                Drink(image: "dripCoffee", name: "Drip Coffee", description: "sample", price: 3.00) //dummy data
            ]
        case "other":
            return [
                Other(image: "newspaper", name: "Newspaper", description: "sample", price: 3.00),
                Other(image: "coffeeBeans", name: "Coffee Beans", description: "sample", price: 2.00),
                Other(image: "coffeeGrinder", name: "Coffee Grinder", description: "sample", price: 13.00)
            ]
        default:
            return [
                Food(image: "", name: "default", description: "default", price: 3.00),
                Food(image: "", name: "default", description: "default", price: 3.00),
                Food(image: "", name: "default", description: "default", price: 3.00)
            ]
        }
    }
    
    private func setup() {
        addSubview(pairingsLargeBox)
        addSubview(pairingsTitle)
        addSubview(stack)
        
        stack.addArrangedSubview(first)
        stack.addArrangedSubview(second)
        stack.addArrangedSubview(third)
        
        NSLayoutConstraint.activate([
            pairingsLargeBox.heightAnchor.constraint(equalToConstant: 180),
            pairingsLargeBox.widthAnchor.constraint(equalToConstant: 340),
            
            pairingsTitle.topAnchor.constraint(equalTo: pairingsLargeBox.topAnchor, constant: 15),
            pairingsTitle.centerXAnchor.constraint(equalTo: pairingsLargeBox.centerXAnchor),
            
            stack.topAnchor.constraint(equalTo: pairingsTitle.bottomAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: pairingsLargeBox.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: pairingsLargeBox.trailingAnchor, constant: -10),
        ])
    }
}
