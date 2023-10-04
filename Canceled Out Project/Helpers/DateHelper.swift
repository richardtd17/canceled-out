//
//  DateHelper.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 10/1/23.
//

import Foundation

func formattedDate(date: Date) -> String {
    let calendar = Calendar.current
   
    let day = calendar.component(.day, from: date)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMMM"
    
    return "\(dateFormatter.string(from: date)) \(day.ordinal)"
    
}
