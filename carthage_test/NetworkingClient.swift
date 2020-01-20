//
//  NetworkingClient.swift
//  carthage_test
//
//  Created by Sudipto Roy on 1/15/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//

import Foundation
import Alamofire

/*
 else if let jsonArray = response.result.value as? [[String : Any]]
 {
 completion(jsonArray, nil)
 }
 */
class NetworkingClient {
    
    typealias webServiceResponse = ([[String: Any]]?, Error?) -> Void
    
    func execute(_ url: URL, completion: @escaping webServiceResponse) {
        
        // API requesting function
        Alamofire.request(url).validate().responseJSON { response in
            
            // Checking Error
            if let error = response.error {
                completion(nil, error)
            }
             // Getting json dictionary
            else if let jsonDict = response.result.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
    }
}
