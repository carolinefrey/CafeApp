//
//  DetailViewController.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/5/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - UI Properties
    var selectedItem: MenuItem
    
    let itemName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Inter-SemiBold", size: 34)
        name.textColor = .black
        return name
    }()
    
    lazy var detailCircle: SelectedItemDetailView = {
        let circle = SelectedItemDetailView(selectedItem: selectedItem)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    lazy var ingredients: IngredientsBoxView = {
        let ingredients = IngredientsBoxView(selectedItem: selectedItem)
        ingredients.translatesAutoresizingMaskIntoConstraints = false
        return ingredients
    }()
    
    lazy var pairings: PairingsLargeBoxView = {
        let pairings = PairingsLargeBoxView(selectedItem: selectedItem)
        pairings.translatesAutoresizingMaskIntoConstraints = false
        return pairings
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 30
        return stack
    }()
    
    // MARK: - Initializers
    init(selectedItem: MenuItem) {
        self.selectedItem = selectedItem
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        itemName.text = "\(selectedItem.name)"
        
        setup()
    }
    
    // MARK: - UI Setup
    
    private func setup() {
        view.addSubview(itemName)
        view.addSubview(stack)
        
        stack.addArrangedSubview(detailCircle)
        stack.addArrangedSubview(ingredients)
        stack.addArrangedSubview(pairings)
        
        NSLayoutConstraint.activate([
            itemName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            itemName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            detailCircle.heightAnchor.constraint(equalToConstant: 260),
            detailCircle.widthAnchor.constraint(equalToConstant: 260),
            ingredients.heightAnchor.constraint(equalToConstant: 96),
            ingredients.widthAnchor.constraint(equalToConstant: 290),
            pairings.heightAnchor.constraint(equalToConstant: 180),
            pairings.widthAnchor.constraint(equalToConstant: 340),
            
            stack.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
        ])
    }
}
