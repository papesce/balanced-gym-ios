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
        let nexercises = withGroupedExercise.targets.reduce(0, {(sum: Int, target: Targets) -> Int in sum + target.exercises.count})
         self.subLabel.text = "\(withGroupedExercise.targets.count) targets \(nexercises) exercises"
         self.subLabel.textColor = UIColor.blue
        
    }
}
