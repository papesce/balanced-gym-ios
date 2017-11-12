//
//  RoutineTableViewController.swift
//  BalancedGym
//
//  Created by Pablou on 10/6/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit
import Alamofire

class RoutineTableViewController: UITableViewController, RoutineChangeProtocol {
    
    var routines : [Routine] = []
    
    private func downloadData(completionHandler:  @escaping () -> Void) {
        RestApiManager.sharedInstance.getRoutines(completionHandler: { routines in
            self.routines = routines
            self.tableView.reloadData();
            completionHandler();
        })
    }
    
    @objc func rightButtonAction() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData{}
        //self.navigationItem.rightBarButtonItem = editButtonItem
        self.refreshControl?.addTarget(self, action: #selector(RoutineTableViewController.refresh), for: UIControlEvents.valueChanged)
    }
    
    @objc func refresh(sender:AnyObject) {
        // Updating your data here...
        downloadData {
            self.refreshControl?.endRefreshing()
        }
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
        cell.refresh(with: routine)
        return cell
    }
    
    func reloadRoutine(routine: Routine) {
        RestApiManager.sharedInstance.getRoutine(routineId: routine.id, completionHandler: { routine in
            let index = self.routines.index(where: { (theRoutine) -> Bool in
                return theRoutine.id == routine.id
            })
            self.routines[index!] = routine
            self.tableView.reloadData()
            
        })
    }
    
    func routineModelChanged(routine: Routine) {
        self.reloadRoutine(routine: routine);
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
                vc.delegate = self
            }
        }
    }
    

}
