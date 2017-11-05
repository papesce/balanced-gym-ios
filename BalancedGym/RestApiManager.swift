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
    
    let jsonConverter : JsonConverter = JsonConverter()
    
    let baseURL = "https://balanced-gym-api.herokuapp.com"
    //let baseURL = "http://localhost:5000"

    
    func getRoutines(completionHandler: @escaping ([Routine]) -> Void) {
        Alamofire.request("\(baseURL)/routine").responseJSON {
            response in
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            //to get JSON return value
            if let result = response.result.value {
                let routines : [Routine] = self.jsonConverter.getRoutines(jsonRoutines: result as! [NSDictionary]);
                completionHandler(routines)
            }
        }
    }
    
    func getRoutine(routineId: String, completionHandler: @escaping (Routine) -> Void) {
        Alamofire.request("\(baseURL)/routine/\(routineId)").responseJSON {
            response in
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            //to get JSON return value
            if let result = response.result.value {
                let routine = self.jsonConverter.getRoutine(jsonRoutine: result as! NSDictionary);
                //print(JSON)
                completionHandler(routine)
            }
        }
    }
    
    func getExercise(exercise: Exercise, completionHandler: @escaping (Exercise) -> Void) {
        Alamofire.request("\(baseURL)/exercise/\(exercise.id)").responseJSON {
            response in
            
            if let result = response.result.value {
                let exercise = self.jsonConverter.getExercise(jsonExercise: result as! NSDictionary,
                                                                        loadSeries: true );
                completionHandler(exercise)
            }
        }
    }
    
    func updateExercise(exercise: Exercise ) {
        let series = exercise.series.map{ serie in
            return ["_id": serie.id, "reps": serie.rep!, "weight": serie.weight!]}
        
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
        
    func updateSerie(serie: Serie, completionHandler: @escaping () -> Void ) {
        let reps : Int = serie.rep!
        let weight: Float = serie.weight!
        let parameters: Parameters = [
                "reps": reps, "weight": weight
        ]
        
        let id = serie.id
        let url = "\(baseURL)/serie/\(id)"
        Alamofire.request(url, method: .patch, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            //debugPrint(response)
            //if let json = response.result.value {
            //    print("JSON: \(json)")
            //}
            completionHandler();
        }
    }
    
    func deleteSerie(serie: Serie, completionHandler: @escaping () -> Void) {
        let id = serie.id
        let url = "\(baseURL)/serie/\(id)"
        Alamofire.request(url, method: .delete).responseJSON { response in
            //if let result = response.result.value {
             completionHandler()
            //}
        }
    }
    
    func addSerie(exercise: Exercise, completionHandler: @escaping (Serie) -> Void) {
        let id = exercise.id
        let url = "\(baseURL)/newSerie/\(id)"
        Alamofire.request(url, method: .post).responseJSON { response in
            // print(response)
            //to get status code
            if let result = response.result.value {
                let serie = self.jsonConverter.getSerie(jsonSerie: result as! NSDictionary)
                completionHandler(serie)
            }
        }
        
    }
   
}
