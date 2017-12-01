//
//  Routine.swift
//  BalancedGym
//
//  Created by Pablou on 10/6/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import ObjectMapper


class Routine : Mappable {

    //MARK: Properties
    var id: String
    var name: String
    var exercises: [Exercise] = []
    var groupedExercises: [GroupedExercise] = []
    
    required init?(map: Map){
        self.id = ""
        self.name = ""
    }
    
    func mapping(map: Map) {
        id <- map["_id"]
        name <- map["name"]
        exercises <- map["exercises"]
        groupedExercises <- map["groupedExercises"]
    }
}
    

