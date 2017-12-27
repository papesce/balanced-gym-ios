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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    
    func serieModelChanged() {
        
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
                // vc.delegate = self
            }
        }
    }

}
