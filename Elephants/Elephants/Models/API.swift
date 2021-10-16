//
//  API.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import Foundation

struct API {
    
    let baseURL = "https://elephant-api.herokuapp.com"
    
    func getElephantsURL() -> String {
        return "\(baseURL)/\(EndPoints.elephants)"
    }
}
