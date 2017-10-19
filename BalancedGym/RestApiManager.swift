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
    
     let baseURL = "https://balanced-gym-api.herokuapp.com"
    
    func executeRequest(completionHandler: @escaping ([Routine]) -> Void) {
        Alamofire.request("\(baseURL)/routine").responseJSON {
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
                        let exerciseID = jsonExercise["_id"] as!String
                        let exerciseName = jsonExercise["name"] as! String
                        let jsonSeries  = jsonExercise["series"] as! [NSDictionary]
                        let convertedSeries = jsonSeries.flatMap({(jsonSerie) -> Serie?
                            in
                               let rep = jsonSerie["reps"] as! Int
                               let weight = jsonSerie["weight"] as! Int
                            
                            return Serie(rep: rep, weight: weight)
                        })
                        return Exercise(id: exerciseID, name: exerciseName, series: convertedSeries)
                    })
                    return Routine(name: routineName, exercises: convertedExercises)
                })
                //print(JSON)
                completionHandler(routines)
            }
        }
    }
    
    func updateRequest(exercise: Exercise ) {
        let reps : Int = exercise.series[0].rep
        let weight: Int = exercise.series[0].weight
        let parameters: Parameters = [
            "series": [[
                "reps": reps, "weight": weight
            ]]
        ]
        
        let id = exercise.id
        let url = "\(baseURL)/exercise/\(id)"
        Alamofire.request(url, method: .patch, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
        
      
            
    
   
}
