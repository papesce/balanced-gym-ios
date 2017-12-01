//
//  GroupedExercise.swift
//  BalancedGym
//
//  Created by Pablou on 12/1/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import ObjectMapper



class GroupedExercise : Mappable {
    
    var muscleGroup: String
    var exercises: [Exercise] = []
    
    required init?(map: Map){
        self.muscleGroup = ""
    }
    
    func mapping(map: Map) {
        muscleGroup <- map["muscleGroup"]
        exercises <- map["exercises"]
    }
}
