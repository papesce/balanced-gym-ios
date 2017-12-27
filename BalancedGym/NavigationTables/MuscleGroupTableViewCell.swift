//
//  MuscleGroupTableViewCell.swift
//  BalancedGym
//
//  Created by Pablo Pesce on 26/12/2017.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class MuscleGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func refresh(withGroupedExercise: GroupedExercise) {

         self.nameLabel.text = withGroupedExercise.muscleGroup;
         self.subLabel.text = "\(withGroupedExercise.targets.count) fix exercises"
//        self.daysLabel.text = self.numberOfDays(exercise: withExercise)
//        self.muscleGroupLabel.text = withExercise.target
//        if (withExercise.lastReps > 0) {
//            self.lastLabel.text = "r:" + String(withExercise.lastReps) +
//                " w:" + String(format: "%g", withExercise.lastWeight) + " t:" + String(withExercise.series.count)
//        } else {
//            self.lastLabel.text = ""
//        }
//        self.setLineColor(color: Utils.getLabelColor(text: self.daysLabel.text!))
        
    }
}
