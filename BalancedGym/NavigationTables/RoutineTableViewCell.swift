//
//  RoutineTableViewCell.swift
//  BalancedGym
//
//  Created by Pablou on 10/6/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class RoutineTableViewCell: UITableViewCell {

    //MARK Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var daysLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func refresh(with: Routine) {
        self.nameLabel.text = with.name;
        self.daysLabel.text = self.numberOfDays(routine: with)
        self.setLineColor(color: Utils.getLabelColor(text: self.daysLabel.text!))
    }
    
    func numberOfDays(routine: Routine) -> String {
        if routine.exercises.count == 0 {
            return ""
        }
        let exercise = routine.exercises.max {ex1, ex2 in ex1.lastUpdated < ex2.lastUpdated }
        let date = exercise!.lastUpdated;
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: date)
        let date2 = calendar.startOfDay(for: Date.init())
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return "\(components.day!) days"
    }

    func setLineColor(color: UIColor) {
        self.daysLabel.textColor = color
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
