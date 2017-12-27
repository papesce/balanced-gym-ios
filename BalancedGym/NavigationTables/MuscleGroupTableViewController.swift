//
//  MuscleGroupTableViewController.swift
//  BalancedGym
//
//  Created by Pablo Pesce on 26/12/2017.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class MuscleGroupTableViewController: UITableViewController, SerieChangeProtocol {

    var routine : Routine?
    var delegate: RoutineChangeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = routine!.name
        self.refreshControl?.addTarget(self, action: #selector(MuscleGroupTableViewController.refresh), for: UIControlEvents.valueChanged)
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
        return self.routine!.groupedExercises.count
    }

    func setRoutine(routine: Routine) {
        self.routine = routine;
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
         self.reloadRoutine(completionHandler: {});
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MuscleGroupTableViewCellId",
                                                 for: indexPath) as! MuscleGroupTableViewCell
        let group: GroupedExercise = routine!.groupedExercises[indexPath.row]
        // Configure the cell
        cell.refresh(withGroupedExercise: group);
        //cell.photoImageView.image = routine.photo;
        return cell
    }
    
    @objc func refresh(sender:AnyObject) {
        // Updating your data here...
        self.reloadRoutine {
            self.refreshControl?.endRefreshing()
        }
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMuscleGroupSegueID"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ExerciseTableViewController
                let groupedExercise: GroupedExercise = routine!.groupedExercises[indexPath.row]
                vc.setGroupedExercise(group: groupedExercise);
                vc.setDelegate(delegate: self)
            }
        }
    }
    

}
