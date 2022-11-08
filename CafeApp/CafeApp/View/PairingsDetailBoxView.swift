//
//  PairingsDetailBoxView.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/7/22.
//

import UIKit

class PairingsDetailBoxView: UIView {
    
    //MARK: - UI Properties
    
    let item: MenuItem
    
    let pairingsSmallBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .white
        box.clipsToBounds = true
        box.layer.cornerRadius = 10
        return box
    }()
    
    let pairingImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sizeToFit()
        return image
    }()
    
    let pairingTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Inter-Medium", size: 14)
        title.textColor = .black
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    let pairingPrice: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont(name: "Inter-Thin", size: 14)
        price.textColor = .black
        return price
    }()
    
    //MARK: - Initializers
    
    init(item: MenuItem) {
        self.item = item
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    private func setup() {
       addSubview(pairingsSmallBox)
       addSubview(pairingImage)
       addSubview(pairingTitle)
       addSubview(pairingPrice)
        
        let priceFormat = NumberFormatter()
        priceFormat.numberStyle = .currency
        pairingPrice.text = priceFormat.string(from: NSNumber(value: item.price))
        pairingTitle.text = "\(item.name)"
        pairingImage.image = UIImage(named: "\(item.image)")
        
        NSLayoutConstraint.activate([
            pairingsSmallBox.heightAnchor.constraint(equalToConstant: 118),
            pairingsSmallBox.widthAnchor.constraint(equalToConstant: 96),

            pairingImage.topAnchor.constraint(equalTo: pairingsSmallBox.topAnchor, constant: 10),
            pairingImage.centerXAnchor.constraint(equalTo: pairingsSmallBox.centerXAnchor),
            pairingImage.heightAnchor.constraint(equalToConstant: 50),
            pairingImage.widthAnchor.constraint(equalToConstant: 50),

            pairingTitle.topAnchor.constraint(equalTo: pairingImage.bottomAnchor, constant: 7),
            pairingTitle.centerXAnchor.constraint(equalTo: pairingsSmallBox.centerXAnchor),

            pairingPrice.topAnchor.constraint(equalTo: pairingTitle.bottomAnchor),
            pairingPrice.centerXAnchor.constraint(equalTo: pairingsSmallBox.centerXAnchor),
        ])
    }
}
