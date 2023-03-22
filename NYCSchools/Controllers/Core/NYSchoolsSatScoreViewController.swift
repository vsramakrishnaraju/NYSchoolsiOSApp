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
    var nySchoolFull1: [NYSchools]?
    var nySchoolFull2: [NYSchoolsSATScore]?
    var indexRow: Int?
    
    var foundMatchingSatScore = false
    
    var collB: NYSchoolsSATScore?
    
    var readScore: String?
    
    let titleLabel = UILabel()
    let label = UILabel()
    let locationlable = UILabel()
    let satlable = UILabel()
    
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
        
        if let nySchoolFull2 = nySchoolFull2 {
            for school in nySchoolFull2 {
                if (nySchoolFull1![indexRow!].dbn == school.dbn) {
                    foundMatchingSatScore = true
                    satlable.frame = CGRect(x: 20, y: 500, width: 300, height: 300)
                    satlable.text = "SAT Reading Ave Score: " + school.sat_critical_reading_avg_score! + "\nSAT Math Ave Score: " +  school.sat_math_avg_score! + "\nSAT Writing Ave Score: " +  school.sat_writing_avg_score!
                    satlable.textAlignment = .left
                    satlable.numberOfLines = 0
                    view.addSubview(satlable)
                }
            }
            if !foundMatchingSatScore {
                satlable.frame = CGRect(x: 20, y: 500, width: 300, height: 300)
                satlable.text = "SAT Reading Ave Score: N/A \nSAT Math Ave Score: N/A \nSAT Writing Ave Score: N/A"
                satlable.textAlignment = .left
                satlable.numberOfLines = 0
                view.addSubview(satlable)
            }
        }
    }
}
