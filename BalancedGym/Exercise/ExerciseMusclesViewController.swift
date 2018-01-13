//
//  ExerciseMusclesViewController.swift
//  BalancedGym
//
//  Created by Pablo Pesce on 13/01/2018.
//  Copyright © 2018 Pablou. All rights reserved.
//

import UIKit

class ExerciseMusclesViewController: UIViewController {

     var exercise: Exercise?
    @IBOutlet weak var muscleGroupLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
     @IBOutlet weak var synergists: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.muscleGroupLabel.text = exercise!.muscleGroup
        self.targetLabel.text = exercise!.target!.name
        //self.synergists.text = exercise!.synergists
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
