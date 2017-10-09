//
//  RoutineDetailsViewController.swift
//  BalancedGym
//
//  Created by Pablou on 10/7/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class RoutineDetailsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var labelText = "It is working d"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
