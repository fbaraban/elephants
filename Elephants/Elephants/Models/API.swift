//
//  API.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import Foundation

/// API model
struct API {
    
    let baseURL = "https://elephant-api.herokuapp.com"
    
    /// returns the string URL to Elephants endpoint
    func getElephantsURL() -> String {
        return "\(baseURL)/\(EndPoints.elephants)"
    }
}
