//
//  ViewController.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    let cafeTitle = UILabel()
    let cafeImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Background")
        
        view.addSubview(cafeTitle)
        view.addSubview(cafeImage)
    }


}

