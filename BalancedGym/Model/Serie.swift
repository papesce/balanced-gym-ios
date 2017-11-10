//
//  Serie.swift
//  BalancedGym
//
//  Created by Pablou on 10/18/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import ObjectMapper

class Serie : Mappable {
    var id:String = ""
    var reps: Int = 0
    var weight: Float = 0.0
    var updatedAt: Date = Date.init()
    var createdAt: Date = Date.init()
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["_id"]
        reps <- map["reps"]
        weight <- map["weight"]
        createdAt <- (map["createdAt"], BDateTransform())
        updatedAt <- (map["updatedAt"], BDateTransform())
        
    }
}
