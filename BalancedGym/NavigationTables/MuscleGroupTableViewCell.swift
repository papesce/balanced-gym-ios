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
        setNumberOfDays(group: withGroupedExercise);
    }
    
    func setNumberOfDays(group: GroupedExercise) {
        let ntargets = group.targets.count
        let nexercises = group.targets.reduce(0, {(sum: Int, target: Targets) -> Int in sum + target.exercises.count})
        if (ntargets == 0 || group.lastUpdated == nil) {
            self.subLabel.text = "\(nexercises) targets \(nexercises) exercises"
            self.subLabel.textColor = Utils.getLabelColor(count: 1)
            return
        }
        let date = group.lastUpdated!;
        let days = Utils.getNumberOfDays(date: date)
        self.subLabel.textColor = Utils.getLabelColor(count: days)
        var text = "\(days) days \(ntargets) targets \(nexercises) exercises "
        if (group.doneToday > 0) {
            text = text + "\(group.doneToday) done today"
         }
        self.subLabel.text = text
    }
    
   

}
