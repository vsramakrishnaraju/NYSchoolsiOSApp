//
//  NYSService.swift
//  NYCSchools
//
//  Created by Venkata K on 3/20/23.
//

import Foundation

/// Primary API service object to get NYSchools data
final class NYSServcie {
    
    /// Shared singleton interface
    static let shared = NYSServcie()
    
    /// Privatized constructor
    private init() {}
    
    /// Send NYSchool API call
    /// - Parameters:
    ///   - request: request instace
    ///   - completion: callback with data or error
    public func execute(_ request: NYSRequest, completion: @escaping () -> Void) {
    }
}
