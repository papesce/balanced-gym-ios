//
//  DetailsTableViewCell.swift
//  BalancedGym
//
//  Created by Pablou on 10/10/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    
    @IBOutlet weak var muscleGroupLabel: UILabel!
   
    @IBOutlet weak var lastLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refresh(withExercise: Exercise) {
        
        self.nameLabel.text = withExercise.name;
        self.daysLabel.text = self.numberOfDays(exercise: withExercise)
        self.muscleGroupLabel.text = withExercise.target
        if (withExercise.lastReps > 0) {
            self.lastLabel.text = "r:" + String(withExercise.lastReps) +
            " w:" + String(format: "%g", withExercise.lastWeight) + " t:" + String(withExercise.series.count)
        } else {
            self.lastLabel.text = ""
        }
        self.setLineColor(color: Utils.getLabelColor(text: self.daysLabel.text!))
       
    }

    func setLineColor(color: UIColor) {
        self.daysLabel.textColor = color
        self.muscleGroupLabel.textColor = color
        self.lastLabel.textColor = color
    }
    
    func numberOfDays(exercise: Exercise) -> String {
        if exercise.series.count == 0 {
            return ""
        }
        let date = exercise.lastUpdated;
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: date)
        let date2 = calendar.startOfDay(for: Date.init())
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return "\(components.day!) days"
    }

}
