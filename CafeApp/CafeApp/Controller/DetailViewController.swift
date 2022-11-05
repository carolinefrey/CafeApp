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

    let itemName = UILabel()
    lazy var detailCircle = SelectedItemDetailView(selectedItem: selectedItem)
    lazy var ingredients = IngredientsBox(selectedItem: selectedItem)
    lazy var pairings = PairingsBox(selectedItem: selectedItem)
    let stack = UIStackView()
    
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
        
        view.addSubview(itemName)
        view.addSubview(stack)
        
        configureItemName()
        configureStack()
        
        setConstraints()
    }
    
    // MARK: - UI Setup
    private func configureItemName() {
        itemName.text = "\(selectedItem.name)"
        itemName.font = UIFont(name: "Inter-SemiBold", size: 34)
        itemName.textColor = .black
    }
    
    private func configureStack() {
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 250
    }
    
    private func setConstraints() {
        itemName.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(detailCircle)
        stack.addArrangedSubview(ingredients)
        stack.addArrangedSubview(pairings)
        
        NSLayoutConstraint.activate([
            itemName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            itemName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            stack.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
