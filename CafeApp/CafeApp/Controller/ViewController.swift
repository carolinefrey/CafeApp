//
//  ViewController.swift
//  CafeApp
//
//  Created by Caroline Frey on 11/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let fullMenu = MenuItems()
    
    let cafeTitle = UILabel()
    let cafeImage = UIImageView()
    let titleStack = UIStackView()
    let menu = UITableView()
    
    // MARK: - Initializers
    
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
    
    // MARK: - UI Setup
    
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
        menu.delegate = self
        menu.dataSource = self
        menu.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        menu.register(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MenuTableHeaderView")
        
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

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuTableHeaderView") as? MenuTableHeaderView else {
            return nil
        }
        
        switch section {
        case 0:
            headerView.headerTitle = "Drinks"
        case 1:
            headerView.headerTitle = "Food"
        case 2:
            headerView.headerTitle = "Misc / Other"
        default:
            return nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC: UIViewController
        
        switch indexPath.section {
        case 0:
            detailVC = DetailViewController(selectedItem: fullMenu.drinks[indexPath.row])
        case 1:
            detailVC = DetailViewController(selectedItem: fullMenu.food[indexPath.row])
        case 2:
            detailVC = DetailViewController(selectedItem: fullMenu.other[indexPath.row])
        default:
            detailVC = UIViewController()
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return fullMenu.drinks.count
        case 1:
            return fullMenu.food.count
        case 2:
            return fullMenu.other.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        
        var item: MenuItem?
        
        switch indexPath.section {
        case 0:
            item = fullMenu.drinks[indexPath.row]
        case 1:
            item = fullMenu.food[indexPath.row]
        case 2:
            item = fullMenu.other[indexPath.row]
        default: return UITableViewCell()
        }
        
        if let item = item {
            cell.set(menuItem: item)
        }
        return cell
    }
}
