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
    
    init(id: String, rep: Int, weight: Int) {
        self.id = id
        self.rep = rep
        self.weight = weight
    }
}
