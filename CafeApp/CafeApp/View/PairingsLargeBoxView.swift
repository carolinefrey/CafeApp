//
//  PairingsLargeBoxView.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/5/22.
//

import UIKit

class PairingsLargeBoxView: UIView {
    
    //MARK: - UI Properties
    let selectedItem: MenuItem
    
    let pairingsLargeBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color4")
        box.clipsToBounds = true
        box.layer.cornerRadius = 10
        return box
    }()
    
    let pairingsTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Inter-ExtraLight", size: 16)
        title.textColor = .black
        title.textAlignment = .center
        
        let attributedString = NSMutableAttributedString(string: "pairings")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 12, range: NSRange(location: 0, length: attributedString.length))
        title.attributedText = attributedString
        return title
    }()
    
    lazy var first: PairingsDetailBoxView = {
        let first = PairingsDetailBoxView(item: selectedItem)
        first.translatesAutoresizingMaskIntoConstraints = false
        first.heightAnchor.constraint(equalToConstant: 116).isActive = true
        first.widthAnchor.constraint(equalToConstant: 96).isActive = true
        return first
    }()
    
    lazy var second: PairingsDetailBoxView = {
        let second = PairingsDetailBoxView(item: selectedItem)
        second.translatesAutoresizingMaskIntoConstraints = false
        second.heightAnchor.constraint(equalToConstant: 116).isActive = true
        second.widthAnchor.constraint(equalToConstant: 96).isActive = true
        return second
    }()
    
    lazy var third: PairingsDetailBoxView = {
        let third = PairingsDetailBoxView(item: selectedItem)
        third.translatesAutoresizingMaskIntoConstraints = false
        third.heightAnchor.constraint(equalToConstant: 116).isActive = true
        third.widthAnchor.constraint(equalToConstant: 96).isActive = true
        return third
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 15
        return stack
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
        addSubview(pairingsLargeBox)
        addSubview(pairingsTitle)
        addSubview(stack)
        
        stack.addArrangedSubview(first)
        stack.addArrangedSubview(second)
        stack.addArrangedSubview(third)
        
        NSLayoutConstraint.activate([
            pairingsLargeBox.heightAnchor.constraint(equalToConstant: 180),
            pairingsLargeBox.widthAnchor.constraint(equalToConstant: 340),
            
            pairingsTitle.topAnchor.constraint(equalTo: pairingsLargeBox.topAnchor, constant: 15),
            pairingsTitle.centerXAnchor.constraint(equalTo: pairingsLargeBox.centerXAnchor),
            
            stack.topAnchor.constraint(equalTo: pairingsTitle.bottomAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: pairingsLargeBox.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: pairingsLargeBox.trailingAnchor, constant: -10),
        ])
    }
}
