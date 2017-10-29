//
//  Routine.swift
//  BalancedGym
//
//  Created by Pablou on 10/6/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation

class Routine {

    //MARK: Properties
    var id: String
    var name: String
    var exercises: [Exercise] = []
   
    
    //MARK: Initialization
    init(id: String, name: String, exercises: [Exercise]) {
        //initialize stored properties
        self.id = id
        self.name = name
        self.exercises = exercises
       
    }
}
    

