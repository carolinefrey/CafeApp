//
//  SelectedItemDetailView.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/5/22.
//

import UIKit

class SelectedItemDetailView: UIView {
    
    //MARK: - UI Properties
    var selectedItem: MenuItem
    
    let itemCircle: UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = UIColor(named: "Color5")
        circle.clipsToBounds = true
        circle.layer.cornerRadius = 130
        return circle
    }()
    
    let itemImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let itemPriceBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color4")
        box.clipsToBounds = true
        box.layer.cornerRadius = 10
        return box
    }()
    
    let itemPrice: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.tintColor = .black
        price.font = UIFont(name: "Inter-Medium", size: 16)
        return price
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
        
        itemImage.image = UIImage(named: "\(selectedItem.image)")
        
        let priceFormat = NumberFormatter()
        priceFormat.numberStyle = .currency
        itemPrice.text = priceFormat.string(from: NSNumber(value: selectedItem.price))
        
        addSubview(itemCircle)
        addSubview(itemImage)
        addSubview(itemPriceBox)
        addSubview(itemPrice)
        
        NSLayoutConstraint.activate([
            itemCircle.heightAnchor.constraint(equalToConstant: 260),
            itemCircle.widthAnchor.constraint(equalToConstant: 260),
            
            itemImage.centerYAnchor.constraint(equalTo: itemCircle.centerYAnchor),
            itemImage.centerXAnchor.constraint(equalTo: itemCircle.centerXAnchor),
            itemImage.heightAnchor.constraint(equalToConstant: 130),
            itemImage.widthAnchor.constraint(equalToConstant: 130),
            
            itemPriceBox.topAnchor.constraint(equalTo: itemCircle.topAnchor, constant: 230),
            itemPriceBox.centerXAnchor.constraint(equalTo: itemCircle.centerXAnchor),
            itemPriceBox.heightAnchor.constraint(equalToConstant: 45),
            itemPriceBox.widthAnchor.constraint(equalToConstant: 75),
            
            itemPrice.centerYAnchor.constraint(equalTo: itemPriceBox.centerYAnchor),
            itemPrice.centerXAnchor.constraint(equalTo: itemPriceBox.centerXAnchor),
        ])
    }
}
