//
//  NYSchoolsSatScore.swift
//  NYCSchools
//
//  Created by Venkata K on 3/20/23.
//

import Foundation

struct NYSchoolsSATScore: Codable {
    let dbn: String?
    let school_name: String?
    let num_of_sat_test_takers: String?
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
}
