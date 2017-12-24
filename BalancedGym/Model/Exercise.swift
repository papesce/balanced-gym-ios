//
//  Exercise.swift
//  BalancedGym
//
//  Created by Pablou on 10/10/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import ObjectMapper

class Exercise : Mappable {
    
    var id: String = ""
    var name: String = ""
    var series: [Serie] = []
    var updatedAt: Date = Date.init()
    var createdAt: Date = Date.init()
    var lastUpdated: Date = Date.init()
    var muscleGroup: String = ""
    var gifURL : String = ""
    var target: String = ""
    var lastReps: Int = 0
    var lastWeight: Float = 0.0
    var suggestedSerie: Serie?
    var multiplier: Int = 1
    var equipment: String = "None"
    var normalizedWeight: Float = 0.0
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["_id"]
        name <- map["name"]
        series <- map["series"]
        createdAt <- (map["createdAt"], BDateTransform())
        updatedAt <- (map["updatedAt"], BDateTransform())
        lastUpdated <- (map["lastUpdated"], BDateTransform())
        muscleGroup <- map["muscleGroup"]
        gifURL <- map["gifURL"]
        target <- map["target"]
        lastReps <- map["lastReps"]
        lastWeight <- map["lastWeight"]
        suggestedSerie <- map["suggestedSerie"]
        multiplier <- map["multiplier"]
        equipment <- map["equipment"]
        normalizedWeight <- map["normalizedWeight"]
    }
    
}
