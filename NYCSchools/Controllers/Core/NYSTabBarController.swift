//
//  ViewController.swift
//  NYCSchools
//
//  Created by Venkata K on 3/16/23.
//

import UIKit

final class NYSTabBarController: UITabBarController {
    
    // Mark: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
    }
    
    private func setUpTabs() {
        let NYSchoolsVC = NYSchoolsViewController()
        let NYSSettingsVC = NYSSettingsViewController()
        
        NYSchoolsVC.navigationItem.largeTitleDisplayMode = .automatic
        NYSSettingsVC.navigationItem.largeTitleDisplayMode = .automatic

        let nav1 = UINavigationController(rootViewController: NYSchoolsVC)
        let nav2 = UINavigationController(rootViewController: NYSSettingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "NYShools", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        
        for nav in [nav1, nav2] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2], animated: true)
    }
    
}
