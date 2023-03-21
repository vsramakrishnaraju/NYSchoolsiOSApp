//
//  NYSchoolsSatScoreViewController.swift
//
//  Created by Venkata K on 3/20/23.
//

import UIKit

/// controlelr to serach for NYSchoolsSatscore
final class NYSchoolsSatScoreViewController: UIViewController {
    
    var nySchoolSat: String?
    var text: String?
    var nySchoolLocn: String?
    
    var collB: NYSchoolsSATScore?
    
    var readScore: String?
    
    let titleLabel = UILabel()
    let label = UILabel()
    let locationlable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .systemBackground
        
        label.frame = CGRect(x: 20, y: 50, width: 300, height: 300)
        label.text = nySchoolSat
        label.textAlignment = .left
        label.numberOfLines = 0
        view.addSubview(label)
        
        locationlable.frame = CGRect(x: 20, y: 240, width: 300, height: 350)
        locationlable.text = text
        locationlable.textAlignment = .left
        locationlable.numberOfLines = 0
        view.addSubview(locationlable)
        
    }
}
