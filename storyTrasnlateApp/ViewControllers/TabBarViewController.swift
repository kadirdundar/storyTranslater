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
        let dictionaryVC = DI_ctionaryViewController()
                
        let homePageNavVC = UINavigationController(rootViewController: homePageVC)
        let profileNavVC = UINavigationController(rootViewController: profileVC)
        let dictionaryNavVC = UINavigationController(rootViewController: dictionaryVC)
                
        homePageNavVC.tabBarItem = UITabBarItem(title: "Ana Sayfa", image: UIImage(systemName: "house"), tag: 0)
        profileNavVC.tabBarItem = UITabBarItem(title: "Profil", image: UIImage(systemName: "person"), tag: 1)
        dictionaryVC.tabBarItem = UITabBarItem(title: "Dictionary", image: UIImage(systemName: "book"), tag: 2)
                
        viewControllers = [homePageNavVC, dictionaryNavVC,profileNavVC]
            }    
    

    

}
