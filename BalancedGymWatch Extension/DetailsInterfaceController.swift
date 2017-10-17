//
//  DetailsInterfaceController.swift
//  BalancedGymWatch Extension
//
//  Created by Pablou on 10/9/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import WatchKit
import Foundation

class DetailsInterfaceController: WKInterfaceController {
    
    var routine: Routine = Routine(name: "It is wrokgin",
            exercises: [Exercise(name: "ex1")])
    
    @IBOutlet var exerciseTable: WKInterfaceTable!
    
    
    override func awake(withContext context: Any?) {
        //let label = context as! String
        self.routine = context as! Routine
        //labelView.setText(label)
        //label = "Triceps"
        //labelView.setText(label)
    }
    
    func tableRefresh() {
        exerciseTable.setNumberOfRows(routine.exercises.count, withRowType: "ExerciseTableRowControllerID")
        for index in 0 ..< exerciseTable.numberOfRows {
            let row = exerciseTable.rowController(at: index) as! ExerciseTableRowController
            row.exerciseName.setText(routine.exercises[index].name)
            //row.image.setImageNamed(routines[index].photo)
            
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
         tableRefresh()
    }
    
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }

}
