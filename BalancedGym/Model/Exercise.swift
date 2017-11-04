//
//  Exercise.swift
//  BalancedGym
//
//  Created by Pablou on 10/10/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation

class Exercise {
    
    var id: String
    var name: String
    var series: [Serie]
    //var seriesSize: Int
    var updatedAt: Date
    var createdAt: Date
    var lastUpdated: Date
    var muscleGroup: String
    
    
    init(id: String, name: String, series: [Serie], updatedAt: Date, createdAt: Date, muscleGroup: String) {
        self.id = id
        self.name = name
        self.series = series
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.lastUpdated = createdAt
        self.muscleGroup = muscleGroup
    }
    
    init(id: String, name: String, series: [Serie], updatedAt: Date, createdAt: Date, lastUpdated: Date, muscleGroup: String) {
        self.id = id
        self.name = name
        self.series = series
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.lastUpdated = lastUpdated
        self.muscleGroup = muscleGroup
    }
    
}
