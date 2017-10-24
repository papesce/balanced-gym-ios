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
        self.daysLabel.text = self.format(date: withExercise.updatedAt)
    }
    
    func format(date: Date) -> String {
        return "1 days"
    }

}
