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
    public let productVC = ProductsViewController()
    public let profileVC = UIViewController()
    public let dailyEntryVC = DailyEntryViewController()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        loadTabBarItems()
        viewControllers = [homeVC, statsVC, dailyEntryVC, productVC, profileVC]
    }
    
    func loadTabBarItems() {
        let homeItem = UITabBarItem()
        homeItem.title = "Home"
        homeItem.image = UIImage(named: "homeIcon")
        
        let statsItem = UITabBarItem()
        statsItem.title = "Stats"
        statsItem.image = UIImage(named: "statIcon")
        
        let productItem = UITabBarItem()
        productItem.title = "Products"
        productItem.image = UIImage(named: "productUsedIcon")
        
        let profileItem = UITabBarItem()
        profileItem.title = "Profile"
        profileItem.image = UIImage(named: "profileIcon")
        
        let dailyEntryItem = UITabBarItem()
        dailyEntryItem.image = UIImage(named: "addData")
            
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:.selected)
        
        homeVC.tabBarItem = homeItem
        statsVC.tabBarItem = statsItem
        productVC.tabBarItem = productItem
        profileVC.tabBarItem = profileItem
        dailyEntryVC.tabBarItem = dailyEntryItem
        
    }
    
    
    
    
}
