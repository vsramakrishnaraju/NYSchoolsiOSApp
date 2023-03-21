//
//  NYSEndPoint.swift
//  NYCSchools
//
//  Created by Venkata K on 3/20/23.
//

import Foundation

/// representes unique API endpoint
@frozen enum NYSEndPoint: String {
    /// endpoint to NYSchools info
    case NYSchools = "s3k6-pzi2.json"
    case NYSChoolsSatScore = "f9bf-2cp4.json"
}
