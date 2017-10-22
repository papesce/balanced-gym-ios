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
    
    func getRoutines(completionHandler: @escaping ([Routine]) -> Void) {
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
                        return Exercise(id: exerciseID, name: exerciseName, series: [])
                    })
                    return Routine(name: routineName, exercises: convertedExercises)
                })
                //print(JSON)
                completionHandler(routines)
            }
        }
    }
    
    func getExercise(exercise: Exercise, completionHandler: @escaping (Exercise) -> Void) {
        Alamofire.request("\(baseURL)/exercise/\(exercise.id)").responseJSON {
            response in
            // print(response)
            //to get status code
            if let status = response.response?.statusCode {
                switch(status){
                case 201:
                    print("example success")
                default:
                    print("response status: \(status)")
                }
            }
            //to get JSON return value
            if let result = response.result.value {
                let jsonExercise = result as! NSDictionary
                        let exerciseID = jsonExercise["_id"] as!String
                        let exerciseName = jsonExercise["name"] as! String
                        let jsonSeries  = jsonExercise["series"] as! [NSDictionary]
                        let convertedSeries = jsonSeries.flatMap({(jsonSerie) -> Serie?
                            in
                               let serieID = jsonSerie["_id"] as! String
                               let rep = jsonSerie["reps"] as! Int
                               let weight = jsonSerie["weight"] as! Int
                        
                            return Serie(id: serieID, rep: rep, weight: weight)
                        })
                    let exercise = Exercise(id: exerciseID, name: exerciseName, series: convertedSeries)
                completionHandler(exercise)
            }
        }
    }
    
    func updateExercise(exercise: Exercise ) {
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
        
    func updateSerie(serie: Serie ) {
        let reps : Int = serie.rep
        let weight: Int = serie.weight
        let parameters: Parameters = [
                "reps": reps, "weight": weight
        ]
        
        let id = serie.id
        let url = "\(baseURL)/serie/\(id)"
        Alamofire.request(url, method: .patch, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
    
    func addSerie(exercise: Exercise, completionHandler: @escaping (Serie) -> Void) {
        let id = exercise.id
        let url = "\(baseURL)/newSerie/\(id)"
        Alamofire.request(url, method: .post).responseJSON { response in
            // print(response)
            //to get status code
            if let status = response.response?.statusCode {
                switch(status){
                case 201:
                    print("example success")
                default:
                    print("response status: \(status)")
                }
            }
            //to get JSON return value
            if let result = response.result.value {
                let jsonSerie = result as! NSDictionary
                let serieID = jsonSerie["_id"] as! String
                let rep = jsonSerie["reps"] as! Int
                let weight = jsonSerie["weight"] as! Int
                let serie = Serie(id: serieID, rep: rep, weight: weight)
                completionHandler(serie)
            }
        }
    }
            
    
   
}
