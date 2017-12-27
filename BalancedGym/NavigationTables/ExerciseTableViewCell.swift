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
        setNumberOfDays(exercise: withExercise)
        self.muscleGroupLabel.text = ""
        if (withExercise.lastReps > 0) {
            self.lastLabel.text = "r:" + String(withExercise.lastReps) +
            " w:" + String(format: "%g", withExercise.lastWeight) + " t:" + String(withExercise.series.count)
        } else {
            self.lastLabel.text = ""
        }
        
       
    }

    func setLineColor(color: UIColor) {
        self.daysLabel.textColor = color
        self.muscleGroupLabel.textColor = color
        self.lastLabel.textColor = color
    }
    
    func setNumberOfDays(exercise: Exercise)  {
        if exercise.series.count == 0 {
            self.daysLabel.text = ""
            return
        }
        let date = exercise.lastUpdated;
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: date)
        let date2 = calendar.startOfDay(for: Date.init())
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        let days = components.day!
        self.daysLabel.text =  "\(days) days"
        self.setLineColor(color: Utils.getLabelColor(count: days))
    }

}
