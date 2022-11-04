//
//  MenuTableHeaderView.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/4/22.
//

import UIKit

class MenuTableHeaderView: UITableViewHeaderFooterView {

    // MARK: - Class Properties
    
    var headerTitle: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: headerTitle)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
            headerLabel.attributedText = attributedString
        }
    }
    
    // MARK: - UI Properties
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Inter-Medium", size: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    // MARK: - Initializers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUpHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpHeader() {
        contentView.backgroundColor = UIColor(named: "Color2")
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(divider)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headerLabel.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -16),
            
            divider.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}
