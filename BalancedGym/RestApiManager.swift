//
//  RestApiManager.swift
//  BalancedGym
//
//  Created by Pablou on 10/15/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class RestApiManager {
    static let sharedInstance = RestApiManager()
    
    let baseURL = Bundle.main.infoDictionary!["BASE_URL"] as! String
    //let baseURL = "https://balanced-gym.herokuapp.com"
    //let baseURL2 = "http://localhost:5000"

    
    func getRoutines(completionHandler: @escaping ([Routine]) -> Void) {
        Alamofire.request("\(baseURL)/routine").responseArray { (response : DataResponse<[Routine]>) in
           let routines = response.result.value
            completionHandler(routines!)
            
        }
    }
    
    func getRoutine(routineId: String, completionHandler: @escaping (Routine) -> Void) {
        Alamofire.request("\(baseURL)/routine/\(routineId)").responseObject {
            (response: DataResponse<Routine>) in
            let routine = response.result.value
             completionHandler(routine!)
        }
    }
    
    func getMuscleGroup(muscleGroup: String,  routineId: String, completionHandler: @escaping (GroupedExercise) -> Void) {
        let parameters: Parameters = [
            "routineId": routineId,
            "muscleGroup": muscleGroup
        ]
        Alamofire.request("\(baseURL)/muscleGroup", parameters: parameters).responseObject {
            (response: DataResponse<GroupedExercise>) in
            let group = response.result.value
            completionHandler(group!)
        }
    }
    
//    func getExercise(exercise: Exercise, completionHandler: @escaping (Exercise) -> Void) {
//        Alamofire.request("\(baseURL)/exercise/\(exercise.id)").responseObject {
//            (response: DataResponse<Exercise>) in
//             let exercise = response.result.value
//              completionHandler(exercise!)
//        }
//    }
    
    func updateExercise(exercise: Exercise ) {
        let series = exercise.series.map{ serie in
            return ["_id": serie.id, "reps": serie.reps, "weight": serie.weight]}
        
        let parameters: Parameters = [
            "series": series
        ]
        
        let id = exercise.id
        let url = "\(baseURL)/exercise/\(id)"
        Alamofire.request(url, method: .patch, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            //debugPrint(response)
            //if let json = response.result.value {
                //print("JSON: \(json)")
            //}
            
            
        }
    }
        
    func updateSerie(serie: Serie, completionHandler: @escaping () -> Void ) {
        let reps : Int = serie.reps
        let weight: Float = serie.weight
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
        Alamofire.request(url, method: .post).responseObject { (response : DataResponse<Serie>) in
            // print(response)
            //to get status code
            if let serie : Serie = response.result.value {
                //let serie = self.jsonConverter.getSerie(jsonSerie: result as! NSDictionary)
                completionHandler(serie)
            }
        }
        
    }
   
}
