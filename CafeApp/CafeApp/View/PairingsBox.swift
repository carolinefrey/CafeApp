//
//  PairingsBox.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/5/22.
//

import UIKit

class PairingsBox: UIView {

    //MARK: - UI Properties
    let selectedItem: MenuItem

    let pairingsLargeBox = UIView()
    let pairingsTitle = UILabel()
    
    //Make these their own small view
    let pairingsSmallBox = UIView()
    let pairingImage = UIImageView()
    let pairingTitle = UILabel()
    let pairingPrice = UILabel()
    
    //MARK: - Initializers
    init(selectedItem: MenuItem) {
        self.selectedItem = selectedItem
        
        super.init(frame: .zero)
        
        addSubview(pairingsLargeBox)
        addSubview(pairingsTitle)

        configurePairingsLargeBox()
        configurePairingsTitle()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup

    private func configurePairingsLargeBox() {
        pairingsLargeBox.backgroundColor = UIColor(named: "Color4")
        pairingsLargeBox.clipsToBounds = true
        pairingsLargeBox.layer.cornerRadius = 10
    }
    
    private func configurePairingsTitle() {
        pairingsTitle.font = UIFont(name: "Inter-ExtraLight", size: 16)
        pairingsTitle.textColor = .black
        pairingsTitle.textAlignment = .center
        
        let attributedString = NSMutableAttributedString(string: "pairings")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 12, range: NSRange(location: 0, length: attributedString.length))
        pairingsTitle.attributedText = attributedString
    }
    
    private func setConstraints() {
        pairingsLargeBox.translatesAutoresizingMaskIntoConstraints = false
        pairingsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pairingsLargeBox.heightAnchor.constraint(equalToConstant: 180),
            pairingsLargeBox.widthAnchor.constraint(equalToConstant: 340),
        
            pairingsTitle.topAnchor.constraint(equalTo: pairingsLargeBox.topAnchor, constant: 15),
            pairingsTitle.centerXAnchor.constraint(equalTo: pairingsLargeBox.centerXAnchor),
        ])
    }
}
