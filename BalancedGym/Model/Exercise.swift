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
    
    
    init(id: String, name: String, series: [Serie], updatedAt: Date, createdAt: Date) {
        self.id = id
        self.name = name
        self.series = series
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.lastUpdated = createdAt
    }
    
    init(id: String, name: String, series: [Serie], updatedAt: Date, createdAt: Date, lastUpdated: Date) {
        self.id = id
        self.name = name
        self.series = series
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.lastUpdated = lastUpdated
    }
    
}
