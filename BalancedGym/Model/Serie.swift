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
    var isloaded: Bool = true
    var rep: Int?
    var weight: Float?
    var updatedAt: Date?
    var createdAt: Date?
    
    init(id: String) {
        self.id = id
        self.isloaded = false
    }
    
    init(id: String, rep: Int, weight: Float, updatedAt: Date, createdAt: Date) {
        self.id = id
        self.rep = rep
        self.weight = weight
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        
    }
}
