//
//  NYSSettingsViewController.swift
//  NYCSchools
//
//  Created by Venkata K on 3/20/23.
//

import UIKit

/// controlelr for settings
final class NYSSettingsViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        title = "Settings"

        // Do any additional setup after loading the view.
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        label.frame = CGRect(x: 20, y: 100, width: 300, height: 300)
        label.text = "Version Number: " + version!
        label.textAlignment = .left
        label.numberOfLines = 0
        view.addSubview(label)
        
    }
    

}
