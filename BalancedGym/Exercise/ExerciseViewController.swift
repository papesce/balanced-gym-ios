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
    var exerciseDetailsViewController:  ExerciseDetailsViewController?
    
    @IBOutlet weak var containerViewLog: UIView!
    @IBOutlet weak var containerViewDetails: UIView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!

    @IBOutlet weak var muscleGroupLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = exercise!.name
        self.navigationItem.rightBarButtonItem = addButton
        self.muscleGroupLabel.text = exercise!.muscleGroup
        self.targetLabel.text = exercise!.target
        
        if let serie = exercise!.suggestedSerie {
            self.repsLabel.text = String(serie.reps);
            self.weightLabel.text = String(format: "%g", serie.weight)
        } else {
            self.repsLabel.text = ""
            self.weightLabel.text = ""
        }
        // Do any additional setup after loading the view.
        self.containerViewLog.alpha = 0
        self.containerViewDetails.alpha = 1
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
        //todo update the exercise lastrep and lastweigth
        self.delegate?.serieModelChanged();
    }
    
    @IBAction func segmentedButtonChanged(_ sender: UISegmentedControl) {
            if sender.selectedSegmentIndex == 0 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.containerViewLog.alpha = 1
                    self.containerViewDetails.alpha = 0
                })
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.containerViewLog.alpha = 0
                    self.containerViewDetails.alpha = 1
                })
            }
        }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showExerciseLogSegueID" {
                self.serieTableViewController = segue.destination as? SerieTableViewController
                self.serieTableViewController?.exercise = self.exercise
                self.serieTableViewController?.delegate = self;
            
        } else if segue.identifier == "showExerciseDetailsSegueID" {
            self.exerciseDetailsViewController = segue.destination as? ExerciseDetailsViewController
            self.exerciseDetailsViewController?.exercise = self.exercise
            
        }
    }
    

}
