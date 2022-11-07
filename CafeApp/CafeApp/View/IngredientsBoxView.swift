//
//  IngredientsBoxView.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/5/22.
//

import UIKit

class IngredientsBoxView: UIView {

    //MARK: - UI Properties
    let selectedItem: MenuItem
    
    let ingredientsBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color3")
        box.clipsToBounds = true
        box.layer.cornerRadius = 10
        return box
    }()
    
    let ingredientsTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Inter-ExtraLight", size: 16)
        title.textColor = .black
        title.textAlignment = .center
        
        let attributedString = NSMutableAttributedString(string: "ingredients")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 12, range: NSRange(location: 0, length: attributedString.length))
        title.attributedText = attributedString
        return title
    }()
    
    let ingredients: UILabel = {
        let ingredients = UILabel()
        ingredients.translatesAutoresizingMaskIntoConstraints = false
        ingredients.text = "coffee, water"
        ingredients.textColor = .black
        ingredients.textAlignment = .left
        ingredients.font = UIFont(name: "Inter-Medium", size: 14)
        return ingredients
    }()

    //MARK: - Initializers
    init(selectedItem: MenuItem) {
        self.selectedItem = selectedItem
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup

    private func setup() {
        
        addSubview(ingredientsBox)
        addSubview(ingredientsTitle)
        addSubview(ingredients)
        
        NSLayoutConstraint.activate([
            ingredientsBox.heightAnchor.constraint(equalToConstant: 96),
            ingredientsBox.widthAnchor.constraint(equalToConstant: 290),

            ingredientsTitle.topAnchor.constraint(equalTo: ingredientsBox.topAnchor, constant: 15),
            ingredientsTitle.centerXAnchor.constraint(equalTo: ingredientsBox.centerXAnchor),
            
            ingredients.topAnchor.constraint(equalTo: ingredientsTitle.bottomAnchor, constant: 20),
            ingredients.leadingAnchor.constraint(equalTo: ingredientsBox.leadingAnchor, constant: 15)
        ])
    }
}
