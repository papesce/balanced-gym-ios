//
//  InterfaceController.swift
//  BalancedGymWatch Extension
//
//  Created by Pablou on 10/6/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    //MARK: Properties
    var routines = [Routine]();
    
    @IBOutlet var routineTable: WKInterfaceTable!
    
    //MARK: Private Methods
    private func loadSampleRoutines() {
        
        guard let routine1 = Routine(name: "Chest and Triceps") else {
            fatalError("Unable to instantiate routine1")
        }
        guard let routine2 = Routine(name: "Back and Biceps") else {
            fatalError("Unable to instantiate routine1")
        }

        routines += [routine1, routine2]
    }
    
    
    func tableRefresh() {
            routineTable.setNumberOfRows(routines.count, withRowType: "RoutineTableRowController")
            for index in 0 ..< routineTable.numberOfRows {
                let row = routineTable.rowController(at: index) as! RoutineTableRowController
                row.label.setText(routines[index].name)
                //row.image.setImageNamed(routines[index].photo)

            }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        //Load sample data
        loadSampleRoutines()
        // Configure interface objects here.
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

    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
      if segueIdentifier == "WatchSegue" {
             return routines[rowIndex].name
        }
        return nil
    }
}
