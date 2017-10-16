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
    
    //MARK: Private Methods
    private func loadSampleRoutines() {
        //let photo1 = UIImage(named: "routine1" )
        //let photo2 = UIImage(named: "routine2" )
        //let photo3 = UIImage(named: "routine3" )
        
        let exercises1 = [Exercise(name: "Bench Press")]
        let routine1 = Routine(name: "Chest and Triceps", exercises: exercises1)
        
        let exercises2 = [Exercise(name: "Deadlift")]
        let routine2 = Routine(name: "Back and Biceps", exercises: exercises2)
        
        let exercises3 = [Exercise(name: "Barbell Squat")]
        let routine3 = Routine(name: "Legs and Shoulders", exercises: exercises3)
        
        routines += [routine1, routine2, routine3]
    }
    
    private func downloadData() {
        //RestApiManager.sharedInstance.getAllRoutines(self)
        Alamofire.request("https://balanced-gym-api.herokuapp.com/routine").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
           
            guard let value = response.result.value as? [String: Any],
                let rows = value["data"] as? [[String: Any]] else {
                    print("Malformed data received from fetchAllRooms service")
                    //completion(nil)
                    return
            }
            let rooms = rows.flatMap({ (roomDict) -> Routine? in
                let exercises1 = [Exercise(name: "Bench Press")]
                let routineName = roomDict["name"] as! String
                let routine1 = Routine(name: routineName, exercises: exercises1)
                return routine1
                })
            self.routines = rooms
            self.tableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load sample data
        // loadSampleRoutines()
        downloadData()
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
        return routines.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "RoutineTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
         for: indexPath) as? RoutineTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
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
        if segue.identifier == "mySegue"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ExerciseTableViewController
                let selectedRoutine = routines[indexPath.row]
                vc.routine = selectedRoutine
            }
        }
    }
    

}
