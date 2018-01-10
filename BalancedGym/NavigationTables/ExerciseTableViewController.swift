//
//  DetailsTableViewController.swift
//  BalancedGym
//
//  Created by Pablou on 10/10/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class ExerciseTableViewController: UITableViewController, SerieChangeProtocol {
    
    var delegate: SerieChangeProtocol?
    var routineId: String?
    var groupedExercises: GroupedExercise?
    var collapsed: Bool = false;
    var hidden: [Bool]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = groupedExercises!.muscleGroup
        self.refreshControl?.addTarget(self, action: #selector(ExerciseTableViewController.refresh), for: UIControlEvents.valueChanged)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {     let headerView = UIView()
        let label = UILabel(frame: CGRect(x: 5, y: -5, width: tableView.frame.size.width, height: 35))
        label.text = groupedExercises!.targets[section].target?.name
        label.tag = section
        label.textColor = UIColor.white
        let tap = UITapGestureRecognizer(target: self, action: #selector(ExerciseTableViewController.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        headerView.addSubview(label)
        headerView.backgroundColor = UIColor(red: 84/255, green: 155/255, blue: 68/255, alpha: 1.0) /* #549b44 */
        return headerView
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        let section = sender.view!.tag
        self.hidden![section] = !self.hidden![section]
        // let indexPaths = (0..<3).map { i in return IndexPath(item: i, section: section)  }
        
        //hidden[section] = !hidden[section]
        
        // tableView?.beginUpdates()
        // if self.isCollapsed(section) {
        //    tableView?.deleteRows(at: indexPaths, with: .fade)
        // } else {
        //    tableView?.insertRows(at: indexPaths, with: .fade)
        // }
        // tableView?.endUpdates()
        tableView?.reloadData()
    }
  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedExercises!.targets.count
    }
    
    func isCollapsed(section: Int) -> Bool {
        return self.hidden![section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.isCollapsed(section: section)) { return 0 }
        
        return groupedExercises!.targets[section].exercises.count
    }
    
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return groupedExercises!.targets[section].target
//
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCellID",
               for: indexPath) as! ExerciseTableViewCell
        let exercise = groupedExercises!.targets[indexPath.section].exercises[indexPath.row]
        // Configure the cell
        cell.refresh(withExercise: exercise);
        //cell.photoImageView.image = routine.photo;
        return cell
    }
    
    
    func setDelegate(delegate: SerieChangeProtocol) {
        self.delegate = delegate
    }
  
    func serieModelChanged() {
        //todo knowing the new exercise update only the exercise
        self.reloadMuscleGroup(completionHandler: {})
    }
    
    func setGroupedExercise(group: GroupedExercise, routineId: String) {
        self.groupedExercises = group
        self.hidden = Array(repeating: false, count: group.targets.count)
        self.routineId = routineId
    }
    
    func reloadMuscleGroup(completionHandler:  @escaping () -> Void) {
        if (self.groupedExercises?.muscleGroup != nil && self.routineId != nil) {
            let name = self.groupedExercises!.muscleGroup
            RestApiManager.sharedInstance.getMuscleGroup(muscleGroup: name,  routineId: self.routineId!,
                                                     completionHandler: { groupedExercises in
                                                        self.setGroupedExercise(group: groupedExercises, routineId: self.routineId!)
                                                        self.tableView.reloadData()
                                                        self.delegate?.serieModelChanged()
                                                        completionHandler();
            })
        }
    }
    
    @objc func refresh(sender:AnyObject) {
        // Updating your data here...
        self.reloadMuscleGroup {
            self.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showExerciseSegueID" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedExercise = groupedExercises!.targets[indexPath.section].exercises[indexPath.row]
                let exerciseViewController = segue.destination as! ExerciseViewController
                exerciseViewController.exercise = selectedExercise
                exerciseViewController.delegate = self;
            }
        }
    }
    
    

}

