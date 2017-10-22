//
//  RoutineTableViewController.swift
//  BalancedGym
//
//  Created by Pablou on 10/6/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit
import Alamofire

class RoutineTableViewController: UITableViewController {

    //MARK: Properties
    var routines = [Routine]();
    
    
    private func downloadData() {
        RestApiManager.sharedInstance.getRoutines(completionHandler: { routines in
            self.routines = routines
            self.tableView.reloadData()
        })
        
            
        
    }
    
    @objc func rightButtonAction() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load sample data
        // loadSampleRoutines()
        downloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        //let rightButtonItem = UIBarButtonItem.init(
        //    title: "Title",
        //    style: .done,
        //    target: self,
        //    action: #selector(RoutineTableViewController.rightButtonAction)
        //)
        //self.hidesBottomBarWhenPushed = true;
        //self.navigationItem.title = rightButtonItem
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = editButtonItem
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
        return routines.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineTableViewCellID",
         for: indexPath) as! RoutineTableViewCell
        let routine = routines[indexPath.row]
        // Configure the cell
        cell.nameLabel.text = routine.name;
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
        if segue.identifier == "showRoutineSegueID"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ExerciseTableViewController
                let selectedRoutine = routines[indexPath.row]
                vc.routine = selectedRoutine
            }
        }
    }
    

}
