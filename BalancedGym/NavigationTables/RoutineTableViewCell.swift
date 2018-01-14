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
        setNumberOfDays(routine: with)
        
    }
    
    func countExercises(collection: Array<Targets>) -> Int {
        return collection.reduce(0, {(res: Int, group: Targets) -> Int in res + group.exercises.count})
    }
    
    func setNumberOfDays(routine: Routine) {
        let tcount = routine.groupedExercises.reduce(0, {(res: Int, group: GroupedExercise) -> Int in res + group.targets.count})
        let ecount = routine.groupedExercises.reduce(0, {(res: Int, group: GroupedExercise) -> Int in res + self.countExercises(collection: group.targets)})
        
        if (tcount == 0 || routine.lastUpdated == nil) {
            self.daysLabel.text = "\(tcount) targets"
            return
        }
        let date = routine.lastUpdated!;
        let days = Utils.getNumberOfDays(date: date)
        
        self.daysLabel.textColor = Utils.getLabelColor(count: days)
        var text = "\(days) days \(tcount) targets \(ecount) exercises "
        if (routine.doneToday > 0) {
            text = text + "\(routine.doneToday) done today"
        }
        self.daysLabel.text = text
    }

    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
