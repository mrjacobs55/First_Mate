//
//  CalcPeriod.swift
//  TZ First Mate4
//
//  Created by Mitchell Jacobs on 5/6/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import Foundation

class CalcPeriod : NSDate {
    
    
    func CalcPeriod(){
        
    }
    //    TODO Updates the Current Class Label reguraly
    
    // allow for testing outside of schooltimesd
    func getPeriod(let debug:Bool) -> Int{
        if(debug){
            return 5
        }
        return getPeriod()
    }
    
    func getPeriod() -> Int{
        
        
        let hour = getHour()
        let minute = getMinute()
        
        // TODO Get Day of week
        
        if (hour >= 15) {
            return 10
        } else if (hour >= 14 && minute >= 19) {
            return 9
        } else if (hour >= 13 && minute >= 34) {
            return 8
        } else if (hour >= 12 && minute >= 49) {
            return 7
        } else if (hour >= 12 && minute >= 04) {
            return 6
        } else if (hour >= 11 && minute >= 19) {
            return 5
        } else if (hour >= 10 && minute >= 34) {
            return 4
        } else if (hour >= 9 && minute >= 45) {
            return 3
        } else if (hour >= 9) {
            return 2
        } else if (hour >= 8 && minute >= 15) {
            return 1
        } else {
            return 0
        }
        
    }
    
    
    let date = NSDate()
    func getHour() -> Int{
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Hour, fromDate: date)
        let hour = components.hour
        
        
        return hour
    }
    
    
    func getMinute() -> Int{
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Minute, fromDate: date)
        let minute = components.minute
        
        
        return minute
    }
    
}

