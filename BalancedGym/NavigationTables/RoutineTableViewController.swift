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
        downloadData()
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
