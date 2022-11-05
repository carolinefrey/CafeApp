//
//  SelectedItemDetailView.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/5/22.
//

import UIKit

class SelectedItemDetailView: UIView {

    //MARK: - UI Properties

    let itemCircle = UIView()
    let itemImage = UIImageView()
    let itemPriceBox = UIView()
    let itemPrice = UILabel()
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
}
