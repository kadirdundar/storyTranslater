//
//  TabBarViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homePageVC = HomePageViewController()
                let profileVC = SettingsViewController()
                
                let homePageNavVC = UINavigationController(rootViewController: homePageVC)
                let profileNavVC = UINavigationController(rootViewController: profileVC)
                
                homePageNavVC.tabBarItem = UITabBarItem(title: "Ana Sayfa", image: UIImage(systemName: "house"), tag: 0)
                profileNavVC.tabBarItem = UITabBarItem(title: "Profil", image: UIImage(systemName: "person"), tag: 1)
                
                viewControllers = [homePageNavVC, profileNavVC]
            }    
    

    

}
