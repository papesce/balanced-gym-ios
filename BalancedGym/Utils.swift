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
    
    static func getLabelColor(count: Int) -> UIColor {
        if (count == 0) {
            return  greenColor;
        } else {
            return  blueColor;
        }
    }
    
    static func getNumberOfDays(date: Date) -> Int {
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: date)
        let date2 = calendar.startOfDay(for: Date.init())
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        let days = components.day!
        return days
    }
    
}
