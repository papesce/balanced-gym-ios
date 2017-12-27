//
//  Targets.swift
//  BalancedGym
//
//  Created by Pablo Pesce on 27/12/2017.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import ObjectMapper



class Targets : Mappable {
    
    var target: String
    var exercises: [Exercise] = []
    
    required init?(map: Map){
        self.target = ""
    }
    
    func mapping(map: Map) {
        target <- map["target"]
        exercises <- map["exercises"]
    }
}
