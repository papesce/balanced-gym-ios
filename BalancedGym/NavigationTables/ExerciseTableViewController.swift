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
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.refreshControl?.addTarget(self, action: #selector(ExerciseTableViewController.refresh), for: UIControlEvents.valueChanged)
        
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return routine!.groupedExercises.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routine!.groupedExercises[section].exercises.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return routine!.groupedExercises[section].muscleGroup
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCellID",
               for: indexPath) as! ExerciseTableViewCell 
        let exercise = routine!.groupedExercises[indexPath.section].exercises[indexPath.row]
        // Configure the cell
        cell.refresh(withExercise: exercise);
        //cell.photoImageView.image = routine.photo;
        return cell
    }
    
    func reloadRoutine(completionHandler:  @escaping () -> Void) {
        RestApiManager.sharedInstance.getRoutine(routineId: self.routine!.id, completionHandler: { routine in
            self.setRoutine(routine: routine)
            self.tableView.reloadData()
            self.delegate?.routineModelChanged(routine: self.routine!)
            completionHandler();
        })
    }
  
    func serieModelChanged() {
        //todo knowing the new exercise update only the exercise
        self.reloadRoutine(completionHandler: {});
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showExerciseSegueID" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedExercise = routine!.groupedExercises[indexPath.section].exercises[indexPath.row]
                let exerciseViewController = segue.destination as! ExerciseViewController
                exerciseViewController.exercise = selectedExercise
                exerciseViewController.delegate = self;
            }
        }
    }
    
    func setRoutine(routine: Routine) {
        
        self.routine = sortExercises(routine: routine);
    }
    
    func sortExercises(routine: Routine) -> Routine {
        
        //routine.groupedExercises.forEach{ group in
        //    group.exercises = group.exercises.sorted(by: self.criteria)
        //}
        return routine
    }
    
    func criteria(ex1: Exercise, ex2: Exercise ) -> Bool {
        return true
    }
    

    
    @objc func refresh(sender:AnyObject) {
        // Updating your data here...
        self.reloadRoutine {
            self.refreshControl?.endRefreshing()
        }
    }

}

