//
//  DateTimeManipulation.swift
//  Noted
//
//  Created by Michael Andrew Auer on 3/19/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import Foundation

struct DateTime {
    
    let df: DateFormatter = DateFormatter()
    
    init() {
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    func fmtDate(_ noteDate: String) -> String {
        if (noteDate == "") {
            return ""
        }
        
        let noteNSD: Date = df.date(from: noteDate)!
        let difference = -(noteNSD.timeIntervalSinceNow)
        let oneday: Double = 86400
        
        // Today does not mean in the last 24 hours
        
        if (difference < oneday) {
            return "Today"
        } else if (difference < (oneday * 2)) {
            return "Yesterday"
        } else {
            let noteDateObject = df.date(from: noteDate)
            df.dateFormat = "MM/dd/yy"
            return df.string(from: noteDateObject!)
        }
    }
    func setDate() -> String {
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df.string(from: Date())
    }
}
