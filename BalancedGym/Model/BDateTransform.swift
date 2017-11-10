//
//  BDateTransform.swift
//  BalancedGym
//
//  Created by Pablou on 11/10/17.
//  Copyright © 2017 Pablou. All rights reserved.
//


//  DateTransform.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-13.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014-2016 Hearst

import Foundation
import ObjectMapper

class BDateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String
    var dateFormatter = DateFormatter()

    public init() {
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }
    
    func transformFromJSON(_ value: Any?) -> Date? {
        //if let timeInt = value as? String {
            //eturn Date(timeIntervalSince1970: TimeInterval(timeInt))
        //}
        if let timeStr = value as? String {
            return self.dateFormatter.date(from: timeStr)
        }
        return nil
    }
    
    func transformToJSON(_ value: Date?) -> String? {
        //if let date = value {
        //    return Double(date.timeIntervalSince1970)
        //}
        return nil
    }
}
