//
//  RestApiManager.swift
//  BalancedGym
//
//  Created by Pablou on 10/15/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import Alamofire

class RestApiManager {
    static let sharedInstance = RestApiManager()
    
    // let baseURL = "https://balanced-gym-api.herokuapp.com/"
    
    func executeRequest(completionHandler: @escaping ([Routine]) -> Void) {
        Alamofire.request("https://balanced-gym-api.herokuapp.com/routine").responseJSON {
            response in
            // print(response)
            //to get status code
            if let status = response.response?.statusCode {
                switch(status){
                case 201:
                    print("example success")
                default:
                    print("error with response status: \(status)")
                }
            }
            //to get JSON return value
            if let result = response.result.value {
                let jsonRoutines = result as! [NSDictionary]
                let routines = jsonRoutines.flatMap({ (jsonRoutine) -> Routine? in
                    let routineName = jsonRoutine["name"] as! String
                    //let convertedExercises = [] as [Exercise]
                    let jsonExercises = jsonRoutine["exercises"] as! [NSDictionary]
                    let convertedExercises = jsonExercises.flatMap({ (jsonExercise) -> Exercise? in
                        let exerciseName = jsonExercise["name"] as! String
                        return Exercise(name: exerciseName)
                    })
                    return Routine(name: routineName, exercises: convertedExercises)
                })
                //print(JSON)
                completionHandler(routines)
            }
        }
    }
    
   
}
