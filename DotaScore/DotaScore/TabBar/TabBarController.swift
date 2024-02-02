//
//  TabBarController.swift
//  DotaScore
//
//  Created by Mike Ulanov on 05.01.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabs()
    }
}

private extension TabBarController {
    
    func generateVC(viewController: UIViewController, title: String) -> UIViewController {
        viewController.tabBarItem.title = title
        
        return viewController
    }
    
    func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
    }
    
    func setupTabs() {

        let mainVC = MainViewController()
        

        mainVC.tabBarItem.title = "Главная"
        mainVC.tabBarItem.image = UIImage(systemName: "house")
        
        viewControllers = [mainVC]
    }
}
