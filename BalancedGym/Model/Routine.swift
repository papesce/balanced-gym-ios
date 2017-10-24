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
    var name: String
    var exercises: [Exercise] = []
   
    
    //MARK: Initialization
    init(name: String, exercises: [Exercise]) {
        //initialize stored properties
        self.name = name
        self.exercises = exercises
       
    }
}
    

