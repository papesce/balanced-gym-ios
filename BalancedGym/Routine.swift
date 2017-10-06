//
//  Routine.swift
//  BalancedGym
//
//  Created by Pablou on 10/6/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class Routine {

    //MARK: Properties
    var name: String
    var photo: UIImage?
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?) {
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty  {
            return nil
        }
        
        //initialize stored properties
        self.name = name
        self.photo = photo
    }
    
}
