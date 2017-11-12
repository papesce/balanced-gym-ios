//
//  Utils.swift
//  BalancedGym
//
//  Created by Pablou on 11/11/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static let greenColor: UIColor = UIColor(red: 0, green: 0.498, blue: 0.0392, alpha: 1.0) /* #007f0a */
    static let blueColor: UIColor = UIColor.blue;
    
    static func getLabelColor(text: String) -> UIColor {
        if (text == "0 days") {
            return  greenColor;
        } else {
            return  blueColor;
        }
    }
    
}
