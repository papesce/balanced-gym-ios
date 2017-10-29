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
    
    var routine: Routine?
    
    @IBOutlet var exerciseTable: WKInterfaceTable!
    
    
    override func awake(withContext context: Any?) {
        self.routine = context as? Routine
    }
    
    func tableRefresh() {
        exerciseTable.setNumberOfRows(routine!.exercises.count, withRowType: "ExerciseTableRowControllerID")
        for index in 0 ..< exerciseTable.numberOfRows {
            let row = exerciseTable.rowController(at: index) as! ExerciseTableRowController
            row.exerciseName.setText(routine!.exercises[index].name)
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
