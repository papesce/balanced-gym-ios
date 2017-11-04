//
//  ExerciseViewController.swift
//  BalancedGym
//
//  Created by Pablou on 10/22/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, SerieChangeProtocol {
    
    

    var delegate: SerieChangeProtocol?
    
    var exercise: Exercise?
    
    var serieTableViewController : SerieTableViewController?
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var muscleGroupLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = exercise!.name
        self.navigationItem.rightBarButtonItem = addButton
        self.muscleGroupLabel.text = exercise!.muscleGroup
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addSerie(_ sender: Any) {
        //add a new serie at the top of the list
        RestApiManager.sharedInstance.addSerie(exercise: exercise!, completionHandler: { newSerie in
            self.serieTableViewController?.refreshNewSerie(newSerie: newSerie)
            self.delegate?.serieModelChanged()
        })
        //
    }
    
    func serieModelChanged() {
        self.delegate?.serieModelChanged();
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showExerciseTableSegueID" {
                self.serieTableViewController = segue.destination as? SerieTableViewController
                self.serieTableViewController?.exercise = self.exercise
                self.serieTableViewController?.delegate = self;
            
        }
    }
    

}
