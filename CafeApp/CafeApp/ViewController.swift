//
//  ViewController.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    let cafeTitle = UILabel()
    let cafeImage = UIImageView()
    let titleStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Background")

        view.addSubview(titleStack)
        
        configureCafeImage()
        configureCafeTitle()
        configureTitleStack()
        
        setConstraints()
    }
    
    private func configureCafeImage() {
        cafeImage.image = UIImage(named: "coffeeTitle")
        cafeImage.contentMode = .scaleAspectFit
    }
    private func configureCafeTitle() {
        cafeTitle.text = "Hanko Cafe"
        cafeTitle.textColor = .black
        cafeTitle.font = UIFont(name: "Inter-Medium", size: 40)
        cafeTitle.textAlignment = .center
    }
    
    private func configureTitleStack() {
        titleStack.axis = .horizontal
        titleStack.alignment = .lastBaseline
        titleStack.distribution = .fill
        titleStack.spacing = 15
    }
    
    private func setConstraints() {
        cafeTitle.translatesAutoresizingMaskIntoConstraints = false
        cafeImage.translatesAutoresizingMaskIntoConstraints = false
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        
        titleStack.addArrangedSubview(cafeImage)
        titleStack.addArrangedSubview(cafeTitle)
        
        NSLayoutConstraint.activate([
            cafeImage.heightAnchor.constraint(equalToConstant: 100),
            cafeImage.widthAnchor.constraint(equalToConstant: 100),
            
            titleStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

