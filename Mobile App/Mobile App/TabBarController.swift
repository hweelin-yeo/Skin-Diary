//
//  SDTabBarController.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/15/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    public let homeVC = HomeViewController()
    public let statsVC = UIViewController()
    public let productVC = UIViewController()
    public let profileVC = UIViewController()
    public let dailyEntryVC = UIViewController()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        loadTabBarItems()
        viewControllers = [homeVC, statsVC, dailyEntryVC, productVC, profileVC]
    }
    
    func loadTabBarItems() {
        let homeItem = UITabBarItem()
        homeItem.image = UIImage(named: "home")
        
        let statsItem = UITabBarItem()
        statsItem.image = UIImage(named: "statistic")
        
        let productItem = UITabBarItem()
        productItem.image = UIImage(named: "products")
        
        let profileItem = UITabBarItem()
        profileItem.image = UIImage(named: "profile")
        
        let dailyEntryItem = UITabBarItem()
        dailyEntryItem.image = UIImage(named: "addData")
        
        homeVC.tabBarItem = homeItem
        statsVC.tabBarItem = statsItem
        productVC.tabBarItem = productItem
        profileVC.tabBarItem = profileItem
        dailyEntryVC.tabBarItem = dailyEntryItem
        
    }
    
    
    
    
}
