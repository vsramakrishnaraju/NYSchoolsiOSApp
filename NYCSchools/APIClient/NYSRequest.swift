//
//  NYSRequest.swift
//  NYCSchools
//
//  Created by Venkata K on 3/20/23.
//

import Foundation

/// object that represents a sngle api call
final class NYSRequest {
    
    /// API constants
    private struct Constants {
        static let baseURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    }
    
    /// endpoint not required here! for future use
    private let endpoint: NYSEndPoint!
    
    /// url string
    public var urlString: String {
        var string = Constants.baseURL
        string += "/"
        
        return string
    }
    
    /// url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// initiate
    /// - Parameters:
    ///   - endpoint: endpoint
    public init(endpoint: NYSEndPoint) {
        self.endpoint = endpoint
    }
}

extension NYSRequest {
    static let listNYSchoolsRequest = NYSRequest(endpoint: .NYSchools)
}
