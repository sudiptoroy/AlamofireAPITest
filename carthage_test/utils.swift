//
//  utils.swift
//  carthage_test
//
//  Created by Sudipto Roy on 1/20/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//

import Foundation
import UIKit

class TimeConversion {
    
    // Timestamp to Custom format conversion
    func getDateFromTimeStamp(timeStamp : Double) -> String {
        
        //Jan 16, 2020 9:53 AM
        let date = NSDate(timeIntervalSince1970: timeStamp)
        
        let dayTimePeriodFormatter = DateFormatter()
        //dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
        dayTimePeriodFormatter.dateFormat = "MMM dd, YYYY hh:mm a"
        // UnComment below to get only time
        //  dayTimePeriodFormatter.dateFormat = "hh:mm a"
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
}


