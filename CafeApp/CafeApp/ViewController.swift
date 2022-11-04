//
//  ViewController.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    let fullMenu = Menu()
    
    let cafeTitle = UILabel()
    let cafeImage = UIImageView()
    let titleStack = UIStackView()
    let menu = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        view.addSubview(titleStack)
        view.addSubview(menu)
        
        configureCafeImage()
        configureCafeTitle()
        configureTitleStack()
        configureMenu()
        
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
    
    private func configureMenu() {
        //menu.delegate = self
        menu.dataSource = self
        menu.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        menu.clipsToBounds = true
        menu.layer.cornerRadius = 30
        menu.rowHeight = 70
    }
    
    private func setConstraints() {
        cafeTitle.translatesAutoresizingMaskIntoConstraints = false
        cafeImage.translatesAutoresizingMaskIntoConstraints = false
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        titleStack.addArrangedSubview(cafeImage)
        titleStack.addArrangedSubview(cafeTitle)
        
        NSLayoutConstraint.activate([
            cafeImage.heightAnchor.constraint(equalToConstant: 100),
            cafeImage.widthAnchor.constraint(equalToConstant: 100),
            
            titleStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            menu.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 30),
            menu.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fullMenu.menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        let currentMenuItem = fullMenu.menuArray[indexPath.row]
        cell.set(menuItem: currentMenuItem)
        return cell
    }
}
