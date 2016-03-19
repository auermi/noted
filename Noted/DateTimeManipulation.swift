//
//  DateTimeManipulation.swift
//  Noted
//
//  Created by Michael Andrew Auer on 3/19/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import Foundation

struct DateTime {
    func fmtDate(noteDate: String) -> String {
        if (noteDate == "") {
            return ""
        }
        let df = NSDateFormatter()
        let noteNSD = df.dateFromString(noteDate)
        let difference = noteNSD?.timeIntervalSinceNow
        
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
}