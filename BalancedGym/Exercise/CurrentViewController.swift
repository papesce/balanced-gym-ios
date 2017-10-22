//
//  CurrentViewController.swift
//  BalancedGym
//
//  Created by Pablou on 10/17/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController, UITextFieldDelegate {

    var exercise: Exercise = Exercise(id: "id0", name: "default", series: [])
    
    @IBOutlet weak var titleLabel: UILabel!
    
  
    @IBOutlet weak var repsField: UITextField!
    
    @IBOutlet weak var weightField: UITextField!
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        // limit to 4 characters
//        let characterCountLimit = 4
//
//        // We need to figure out how many characters would be in the string after the change happens
//        let startingLength = textField.text?.characters.count ?? 0
//        let lengthToAdd = string.characters.count
//        let lengthToReplace = range.length
//
//        let newLength = startingLength + lengthToAdd - lengthToReplace
//
//        return newLength <= characterCountLimit
//    }
    
    
    
    //@IBAction func userTappedBackground(sender: AnyObject) {
    //    view.endEditing(true)
   // }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //self.titleLabel.text = editableField.text
        //self.exercise.series[0].rep = Int(repsField.text!)!
        //self.exercise.series[0].weight = Int(weightField.text!)!
        //RestApiManager.sharedInstance.updateExercise(exercise: self.exercise);
        
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addAccessoryView() -> Void {
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(CurrentViewController.doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        //setting toolbar as inputAccessoryView
        self.repsField.inputAccessoryView = toolbar
        self.weightField.inputAccessoryView = toolbar
    }
 
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.exercise.name
        //self.navigationItem.title = "demo";
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        //init toolbar
        self.addAccessoryView()
        
        //init textfields
         repsField.text = String(self.exercise.series[0].rep)
         weightField.text = String(self.exercise.series[0].weight)
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "currentSegueID" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ExerciseTableViewController
                let selectedRoutine = routines[indexPath.row]
                vc.routine = selectedRoutine
            }
        }
     */

}
