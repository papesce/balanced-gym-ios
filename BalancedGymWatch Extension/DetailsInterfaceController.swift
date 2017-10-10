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
    
    @IBOutlet var labelView: WKInterfaceLabel!
    var label: String = "It is wrokgin"
    
    override func awake(withContext context: Any?) {
        let label = context as! String
        //labelView.setText(label)
        //label = "Triceps"
        labelView.setText(label)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }
    
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }

}
