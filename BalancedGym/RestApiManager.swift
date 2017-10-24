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
    //let baseURL = "http://localhost:5000"
     var dateFormatter = DateFormatter()

    init() {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }
    
    func getRoutines(completionHandler: @escaping ([Routine]) -> Void) {
        Alamofire.request("\(baseURL)/routine").responseJSON {
            response in
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
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
                        let createdAt = self.dateFormatter.date(from: jsonExercise["createdAt"] as! String)
                        let updatedAt = self.dateFormatter.date(from: jsonExercise["updatedAt"] as! String)
                        let jsonSeries  = jsonExercise["series"] as! [String]
                        let series = jsonSeries.map({(id) -> Serie in
                            return Serie(id: id, rep:0, weight:0, updatedAt: Date.init(), createdAt: Date.init())
                        })
                        return Exercise(id: exerciseID, name: exerciseName, series: series,
                         updatedAt: updatedAt!, createdAt: createdAt!)
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
            
            if let result = response.result.value {
                let jsonExercise = result as! NSDictionary
                        let exerciseID = jsonExercise["_id"] as!String
                        let exerciseName = jsonExercise["name"] as! String
                        let jsonSeries  = jsonExercise["series"] as! [NSDictionary]
                        let convertedSeries = jsonSeries.flatMap({(jsonSerie) -> Serie?
                            in
                               let serieID = jsonSerie["_id"] as! String
                               let rep = jsonSerie["reps"] as! Int
                               let weight = jsonSerie["weight"] as! Float
                               let createdAt = self.dateFormatter.date(from: jsonSerie["createdAt"] as! String)
                               let updatedAt = self.dateFormatter.date(from: jsonSerie["updatedAt"] as! String)
                            return Serie(id: serieID, rep: rep, weight: weight, updatedAt: updatedAt!, createdAt: createdAt!)
                        })
                        let createdAt = self.dateFormatter.date(from: jsonExercise["createdAt"] as! String)
                        let updatedAt = self.dateFormatter.date(from: jsonExercise["updatedAt"] as! String)
                    let exercise = Exercise(id: exerciseID, name: exerciseName, series: convertedSeries, updatedAt: updatedAt!, createdAt: createdAt!)
                completionHandler(exercise)
            }
        }
    }
    
    func updateExercise(exercise: Exercise ) {
        let series = exercise.series.map{ serie in
            return ["_id": serie.id, "reps": serie.rep, "weight": serie.weight]}
        
        let parameters: Parameters = [
            "series": series
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
        let weight: Float = serie.weight
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
    
    func deleteSerie(serie: Serie) {
        let id = serie.id
        let url = "\(baseURL)/serie/\(id)"
        Alamofire.request(url, method: .delete)
    }
    
    func addSerie(exercise: Exercise, completionHandler: @escaping (Serie) -> Void) {
        let id = exercise.id
        let url = "\(baseURL)/newSerie/\(id)"
        Alamofire.request(url, method: .post).responseJSON { response in
            // print(response)
            //to get status code
            if let result = response.result.value {
                let jsonSerie = result as! NSDictionary
                let serieID = jsonSerie["_id"] as! String
                let rep = jsonSerie["reps"] as! Int
                let weight = jsonSerie["weight"] as! Float
                let updatedAt = self.dateFormatter.date(from: jsonSerie["updatedAt"] as! String)
                let createdAt = self.dateFormatter.date(from: jsonSerie["createdAt"] as! String)
                let serie = Serie(id: serieID, rep: rep, weight: weight, updatedAt: updatedAt!, createdAt: createdAt!)
                completionHandler(serie)
            }
        }
        
    }
   
}
