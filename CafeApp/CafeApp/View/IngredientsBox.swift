//
//  IngredientsBox.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/5/22.
//

import UIKit

class IngredientsBox: UIView {

    //MARK: - UI Properties
    let selectedItem: MenuItem
    
    let ingredientsBox = UIView()
    let ingredientsTitle = UILabel()
    let ingredients = UILabel()

    //MARK: - Initializers
    init(selectedItem: MenuItem) {
        self.selectedItem = selectedItem
        
        super.init(frame: .zero)
        
        addSubview(ingredientsBox)
        addSubview(ingredientsTitle)
        addSubview(ingredients)
        
        configureIngredientsBox()
        configureIngredientsTitle()
        configureIngredients()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    private func configureIngredientsBox() {
        ingredientsBox.backgroundColor = UIColor(named: "Color3")
        ingredientsBox.clipsToBounds = true
        ingredientsBox.layer.cornerRadius = 10
    }
    
    private func configureIngredientsTitle() {
        ingredientsTitle.font = UIFont(name: "Inter-ExtraLight", size: 16)
        ingredientsTitle.textColor = .black
        ingredientsTitle.textAlignment = .center
        
        let attributedString = NSMutableAttributedString(string: "ingredients")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 12, range: NSRange(location: 0, length: attributedString.length))
        ingredientsTitle.attributedText = attributedString
    }
    
    private func configureIngredients() {
        ingredients.text = "coffee, water"
        ingredients.textColor = .black
        ingredients.textAlignment = .left
        ingredients.font = UIFont(name: "Inter-Medium", size: 14)
    }
    
    private func setConstraints() {
        ingredientsBox.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTitle.translatesAutoresizingMaskIntoConstraints = false
        ingredients.translatesAutoresizingMaskIntoConstraints = false
        
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
