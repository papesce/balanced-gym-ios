//
//  RestApiManager.swift
//  BalancedGym
//
//  Created by Pablou on 10/15/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import Alamofire

class RestApiManager {
    static let sharedInstance = RestApiManager()
    
    let baseURL = "https://balanced-gym-api.herokuapp.com/"
    
    func getAllRoutines() {
        //Alamofire.request(baseURL).responseJSON { response in
        //    print(response.request)  // original URL request
        //    print(response.response) // HTTP URL response
       //     print(response.data)     // server data
       //     print(response.result)   // result of response serialization
       
            //Optional binding to handle exceptions
           // if let json = response.result.value as? [[String:String]] {
           //     self.newsData = json.map{ News(dictionary: $0) }
           //
           //
           // }
       // }
    }
    
   
}
