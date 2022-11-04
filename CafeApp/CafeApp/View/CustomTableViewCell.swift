//
//  CustomTableViewCell.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/3/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var backgroundCell = UIView()
    var itemImage = UIImageView()
    var itemName = UILabel()
    var itemDescription = UILabel()
    var itemPrice = UILabel()

    static let identifier = "CustomTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(backgroundCell)
        addSubview(itemImage)
        addSubview(itemName)
        addSubview(itemDescription)
        addSubview(itemPrice)
        
        configureBackgroundCell()
        configureItemName()
        configureItemDescription()
        configureItemPrice()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(menuItem: MenuItem) {
        itemImage.image = UIImage(named: "\(menuItem.image)")
        itemName.text = menuItem.name
        itemDescription.text = menuItem.description
        
        let priceFormat = NumberFormatter()
        priceFormat.numberStyle = .currency

        itemPrice.text = priceFormat.string(from: NSNumber(value: menuItem.price))
    }
    
    private func configureBackgroundCell() {
        backgroundCell.backgroundColor = UIColor(named: "Color2")
    }
    
    private func configureItemName() {
        itemName.textColor = .black
        itemName.font = UIFont(name: "Inter-Medium", size: 20)
    }
    
    private func configureItemDescription() {
        itemDescription.textColor = .black
        itemDescription.font = UIFont(name: "Inter-ExtraLight", size: 14)
    }
    
    private func configureItemPrice() {
        itemPrice.textColor = .black
        itemPrice.font = UIFont(name: "Inter-Medium", size: 18)
    }
    
    private func setConstraints() {
        backgroundCell.translatesAutoresizingMaskIntoConstraints = false
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemName.translatesAutoresizingMaskIntoConstraints = false
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        itemPrice.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            itemImage.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 10),
            itemImage.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            itemImage.heightAnchor.constraint(equalToConstant: 45),
            itemImage.widthAnchor.constraint(equalToConstant: 45),
            
            itemName.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 10),
            itemName.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 10),
            
            itemDescription.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 5),
            itemDescription.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 10),
            
            itemPrice.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemPrice.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
        ])
    }
}
