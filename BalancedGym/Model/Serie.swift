//
//  Serie.swift
//  BalancedGym
//
//  Created by Pablou on 10/18/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation

class Serie {
    var id:String
    var rep: Int
    var weight: Int
    var updatedAt: Date
    var createdAt: Date
    
    init(id: String, rep: Int, weight: Int, updatedAt: Date, createdAt: Date) {
        self.id = id
        self.rep = rep
        self.weight = weight
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        
    }
}
