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
    
    //let fullMenu = MenuItems()
    
    let itemName = UILabel()
    let detailCircle = SelectedItemDetailView()
    let ingredients = IngredientsBox()
    let pairings = PairingsBox()
    
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
        navigationItem.title = selectedItem.name
        
        view.addSubview(itemName)
        
        configureItemName()
        
    }
    
    // MARK: - UI Setup
    private func configureItemName() {
        itemName.text = "\(selectedItem.name)"
        itemName.font = UIFont(name: "Inter-Medium", size: 20)
    }
    
    private func setConstraints() {
        itemName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        ])
    }
}
