//
//  Muscle.swift
//  BalancedGym
//
//  Created by Pablo Pesce on 09/01/2018.
//  Copyright © 2018 Pablou. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

class Muscle : Mappable {
    var id:String = ""
    var name: String = ""
    var muscleURL: String = ""
    var updatedAt: Date = Date.init()
    var createdAt: Date = Date.init()
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["_id"]
        name <- map["name"]
        muscleURL <- map["muscleURL"]
        createdAt <- (map["createdAt"], BDateTransform())
        updatedAt <- (map["updatedAt"], BDateTransform())
        
    }
}
