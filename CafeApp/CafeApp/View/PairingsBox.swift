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
    let pairingsSmallBox = UIView()
    let pairingImage = UIImageView()
    let pairingTitle = UILabel()
    let pairingPrice = UILabel()
    
    //MARK: - Initializers
    init(selectedItem: MenuItem) {
        self.selectedItem = selectedItem
        
        super.init(frame: .zero)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup

}
