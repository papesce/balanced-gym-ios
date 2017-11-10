//
//  JsonConverter.swift
//  BalancedGym
//
//  Created by Pablou on 10/28/17.
//  Copyright © 2017 Pablou. All rights reserved.
//

import Foundation

class JsonConverter {
    
    var dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }

    
//    func getRoutines(jsonRoutines : [NSDictionary]) -> [Routine] {
//        //let routines = jsonRoutines.reduce([:]) { (result, jsonRoutine) -> Dictionary<String,Routine> in
//        //    let routine : Routine = getRoutine(jsonRoutine: jsonRoutine)
//        //    var ret = result;
//        //    ret[routine.id] = routine
//        //    return ret;
//        //}
//        return jsonRoutines.map({ (jsonRoutine) -> Routine in
//            return self.getRoutine(jsonRoutine: jsonRoutine)
//        });
//    }
    
//    func getRoutine(jsonRoutine : NSDictionary) -> Routine {
//           let routineName = jsonRoutine["name"] as! String
//            let id = jsonRoutine["_id"] as! String
//            //let convertedExercises = [] as [Exercise]
//            let exercises = self.getExercises(jsonExercises: jsonRoutine["exercises"] as! [NSDictionary])
//        return Routine(id: id, name: routineName, exercises: exercises)
//    }
    
//    func getExercises(jsonExercises : [NSDictionary]) -> [Exercise] {
//        let exercises = jsonExercises.flatMap({ (jsonExercise) -> Exercise? in
//            return getExercise(jsonExercise: jsonExercise, loadSeries: false)
//        })
//        return exercises;
//    }
    
//    func getExercise(jsonExercise: NSDictionary, loadSeries: Bool) -> Exercise {
//        let exerciseID = jsonExercise["_id"] as! String
//        let exerciseName = jsonExercise["name"] as! String
//        
//        var convertedSeries : [Serie] = []
//        var exercise : Exercise
//        let createdAt = self.dateFormatter.date(from: jsonExercise["createdAt"] as! String)
//        let updatedAt = self.dateFormatter.date(from: jsonExercise["updatedAt"] as! String)
//        let muscleGroup = jsonExercise["muscleGroup"] as! String
//        if (loadSeries) {
//            let jsonSeries  = jsonExercise["series"] as! [NSDictionary]
//            convertedSeries = jsonSeries.flatMap({(jsonSerie) -> Serie? in
//                return getSerie(jsonSerie: jsonSerie)
//            })
//            exercise = Exercise(id: exerciseID, name: exerciseName, series: convertedSeries,
//                                updatedAt: updatedAt!, createdAt: createdAt!, lastUpdated: createdAt!,
//                                muscleGroup: muscleGroup, lastReps: 0, lastWeight: 0)
//        } else {
//            let idSeries  = jsonExercise["series"] as! [String]
//            convertedSeries = idSeries.flatMap({(idSt) -> Serie? in
//                return Serie(id: idSt)
//            })
//            let lastUpdated =  self.dateFormatter.date(from: jsonExercise["lastUpdated"] as! String)
//            let lastReps = jsonExercise["lastReps"] as! Int
//            let lastWeight = jsonExercise["lastWeight"] as! Float
//            exercise = Exercise(id: exerciseID, name: exerciseName, series: convertedSeries,
//                                updatedAt: updatedAt!, createdAt: createdAt!, lastUpdated: lastUpdated!,
//                                muscleGroup : muscleGroup, lastReps: lastReps, lastWeight: lastWeight)
//        }
//        return exercise
//    }
    
//    func getSerie(jsonSerie: NSDictionary) -> Serie {
//        let serieID = jsonSerie["_id"] as! String
//        let rep = jsonSerie["reps"] as! Int
//        let weight = jsonSerie["weight"] as! Float
//        let updatedAt = self.dateFormatter.date(from: jsonSerie["updatedAt"] as! String)
//        let createdAt = self.dateFormatter.date(from: jsonSerie["createdAt"] as! String)
//        let serie = Serie(id: serieID, rep: rep, weight: weight, updatedAt: updatedAt!, createdAt: createdAt!)
//        return serie
//    }
}
