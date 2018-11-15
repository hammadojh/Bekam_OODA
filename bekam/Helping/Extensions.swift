//
//  Extensions.swift
//  bekam
//
//  Created by Omar on 01/11/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

extension Date {
    
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
    
    func numberOfDays(fromDate:Date , toDate:Date) -> Int{
        
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day], from: fromDate, to: toDate)
        
        return components.day!
    }
    
    static func createDateFromString(stringDate:String) -> Date{
        let fm = DateFormatter()
        if let date = fm.date(from: stringDate){
            return date
        }
        return Date()
    }
    
    func getString(formatString:String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = formatString
        let dateString = formatter.string(from: self)
        return dateString
        
    }
}
