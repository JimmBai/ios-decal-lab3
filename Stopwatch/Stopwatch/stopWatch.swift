//
//  stopWatch.swift
//  stopWatch
//
//  Created by Jim Bai on 2017/2/16.
//  Copyright © 2017年 Jim Bai. All rights reserved.
//

import Foundation
class stopWatch {
    
    let baseTime:Date
    
    init() {
        baseTime = Date.init()
    }
    
    func getTime() -> String{
        let time = -baseTime.timeIntervalSinceNow
        let milli = time.truncatingRemainder(dividingBy: 1)
        let adj_milli = UInt(milli*100)
        let total_sec = UInt(time-milli)
        var min = UInt(total_sec/60)
        let sec = UInt(total_sec%60)
        var timeString = ""
        if(min > 1440) {
            let day = UInt(min/1440)
            let hour = UInt((min - 1440*day)/60)
            min = (min-1440*day)%60
            timeString = String(format: "%d:%02d:%02d", day, hour, min)
        } else if(min>60) {
            let hour = UInt(min/60)
            min = min%60
            timeString = String(format: "%02d:%02d:%02d", hour, min, sec)
        } else {
            timeString = String(format: "%02d:%02d.%02d", min, sec, adj_milli)
        }
        return timeString
    }

}
