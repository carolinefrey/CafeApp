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

    let itemCircle = UIView()
    let itemImage = UIImageView()
    let itemPriceBox = UIView()
    let itemPrice = UILabel()
    
    //MARK: - Initializers
    
    init(selectedItem: MenuItem) {
        self.selectedItem = selectedItem
        
        super.init(frame: .zero)
        
        addSubview(itemCircle)
        addSubview(itemImage)
        addSubview(itemPriceBox)
        addSubview(itemPrice)
        
        configureItemCircle()
        configureItemImage()
        configureItemPriceBox()
        configureItemPrice()
        
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    
    private func configureItemCircle() {
        itemCircle.backgroundColor = UIColor(named: "Color5")
        itemCircle.clipsToBounds = true
        itemCircle.layer.cornerRadius = 130
    }
    
    private func configureItemImage() {
        itemImage.image = UIImage(named: "\(selectedItem.image)")
        itemImage.contentMode = .scaleAspectFit
    }
    
    private func configureItemPriceBox() {
        itemPriceBox.backgroundColor = UIColor(named: "Color4")
        itemPriceBox.clipsToBounds = true
        itemPriceBox.layer.cornerRadius = 10
    }
    
    private func configureItemPrice() {
        itemPrice.tintColor = .black
        itemPrice.font = UIFont(name: "Inter-Medium", size: 16)
        
        let priceFormat = NumberFormatter()
        priceFormat.numberStyle = .currency

        itemPrice.text = priceFormat.string(from: NSNumber(value: selectedItem.price))
    }
    
    private func setConstraints() {
        itemCircle.translatesAutoresizingMaskIntoConstraints = false
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemPriceBox.translatesAutoresizingMaskIntoConstraints = false
        itemPrice.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemCircle.topAnchor.constraint(equalTo: topAnchor),
            itemCircle.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemCircle.trailingAnchor.constraint(equalTo: trailingAnchor),
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
