//
//  DateTimeManipulation.swift
//  Noted
//
//  Created by Michael Andrew Auer on 3/19/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import Foundation

struct DateTime {
    
    let df: NSDateFormatter = NSDateFormatter()
    
    init() {
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    func fmtDate(noteDate: String) -> String {
        if (noteDate == "") {
            return ""
        }
        
        let noteNSD: NSDate = df.dateFromString(noteDate)!
        print(noteDate)
        print(noteNSD)
        let difference = -(noteNSD.timeIntervalSinceNow)
        print("the difference is \(difference)")
        let oneday: Double = 86400
        
        if (difference < oneday) {
            return "Today"
        } else if (difference < (oneday * 2)) {
            return "Yesterday"
        } else {
            df.dateFormat = "mm/dd/yy"
            return df.stringFromDate(df.dateFromString(noteDate)!)
        }
    }
    func setDate() -> String {
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df.stringFromDate(NSDate())
    }
}