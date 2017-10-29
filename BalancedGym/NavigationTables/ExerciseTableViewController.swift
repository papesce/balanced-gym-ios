//
//  DetailsTableViewController.swift
//  BalancedGym
//
//  Created by Pablou on 10/10/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class ExerciseTableViewController: UITableViewController, SerieChangeProtocol {
    
    
    var delegate: RoutineChangeProtocol?
    
    var routine : Routine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = routine!.name
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routine!.exercises.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCellID",
               for: indexPath) as! ExerciseTableViewCell 
        let exercise = routine!.exercises[indexPath.row]
        // Configure the cell
        cell.refresh(withExercise: exercise);
        //cell.photoImageView.image = routine.photo;
        return cell
    }
    
    func reloadRoutine() {
        RestApiManager.sharedInstance.getRoutine(routineId: self.routine!.id, completionHandler: { routine in
            self.routine = routine
            self.tableView.reloadData()
            self.delegate?.routineModelChanged(routine: self.routine!)
        })
    }
  
    func serieModelChanged() {
        self.reloadRoutine();
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showExerciseSegueID" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedExercise = routine!.exercises[indexPath.row]
                let exerciseViewController = segue.destination as! ExerciseViewController
                exerciseViewController.exercise = selectedExercise
                exerciseViewController.delegate = self;
            }
        }
    }
    

}

