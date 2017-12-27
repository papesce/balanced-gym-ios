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
        let date = routine.lastUpdated;
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: date!)
        let date2 = calendar.startOfDay(for: Date.init())
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        self.daysLabel.textColor = Utils.getLabelColor(count: components.day!)
        self.daysLabel.text =  "\(components.day!) days \(tcount) targets \(ecount) exercises"
    }

    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
