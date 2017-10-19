//
//  Exercise.swift
//  BalancedGym
//
//  Created by Pablou on 10/10/17.
//  Copyright © 2017 Pablou. All rights reserved.
//



class Exercise {
    
    var id: String
    var name: String
    var series: [Serie]
    
    init(id: String, name: String, series: [Serie]) {
        self.id = id
        self.name = name
        self.series = series
    }
    
}
