//
//  DateHelper.swift
//  iOSProject
//
//  Created by KairaNewMac on 09/12/16.
//  Copyright © 2016 Kaira NewMac. All rights reserved.
//

import Foundation

//MARK: - Date Helper For Milli Seconds
class DateHelperMilliseconds {
    
    func getCurrentDateTimeMilliseconds(dateFormat:String)-> CLong {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = NSTimeZone.local
        let milliseconds = date.millisecondsSince1970
        return milliseconds
    }
    func convertDateTimeToMilliSecond(strDate:String,dateFormat:String) -> CLong {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        var date = Date()
        date = dateFormatter.date(from: strDate)! as Date
        return date.millisecondsSince1970
    }
    
    func convertMilliSecondToDateString(milliSecond:CLong ,dateFormat:String) -> String {
        return DateHelper().convertStringDateFormate(strDate: "\(Date(milliseconds: milliSecond))", strCurrentFormateType: DateTimeFormate.Formate_yyyyMMddHHmmssZ, strFormateType: dateFormat)
    }
    
}

//MARK: - Get MilliSeconds From Time Interval
struct Milliseconds {
    static let OneDayMilliSecond        = CLong(86401000)
    static let OneHourMilliSecond       = CLong(3600000)
    static let OneMinMilliSeconf        = CLong(60000)
}

//MARK: - Date Function
extension Date {
    var millisecondsSince1970:CLong {
        return CLong((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:CLong) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}

//MARK: - Date Helper Function
class DateHelper {
    
    func getCurrentDateTime(dateFormat:String)-> String
    {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = NSTimeZone.local
        let strcurrentdate = dateFormatter.string(from: date as Date)
        return strcurrentdate;
    }
    
    func getCurrentDateTime_Date(dateFormat:String)-> NSDate
    {
        var date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        date = dateFormatter.date(from: dateFormatter.string(from: date as Date))! as NSDate
        return date;
    }
    
    func stringToNSDateConvert(strdate:String,dateFormat:String) -> NSDate
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        var date = NSDate()
        date = dateFormatter.date(from: strdate)! as NSDate
        return date
    }
    
    func nsdateToStringConvert(strdate:NSDate ,dateFormat:String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.string(from: strdate as Date)
        return date
    }
    
    func dateTimeCompare(FromTime: String, ToTime: String, strFormateType:String) -> ComparisonResult {
        
        let formatter = DateFormatter()
        formatter.dateFormat = strFormateType
        let date1 : NSDate = formatter.date(from: FromTime)! as NSDate
        let date2 : NSDate = formatter.date(from: ToTime)! as NSDate
        let compareResult = date1.compare(date2 as Date)
        return compareResult;
    }
    
    func IsDate(strCurrentDate:String, Between strStartDate:String, strEndDate:String, strFormateType:String) -> Bool {
        
        if dateTimeCompare(FromTime: strCurrentDate, ToTime: strStartDate, strFormateType: strFormateType) == .orderedAscending {
            return false
        }
        if dateTimeCompare(FromTime: strCurrentDate, ToTime: strEndDate, strFormateType: strFormateType) == .orderedDescending {
            return false
        }
        return true
    }
    
    func convertStringDateFormate(strDate: String, strCurrentFormateType:String, strFormateType:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strCurrentFormateType
        var strNewdate = NSDate()
        strNewdate = dateFormatter.date(from: strDate)! as NSDate
        dateFormatter.dateFormat = strFormateType;
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: strNewdate as Date)
    }
    
    func convertNSDateFormate(strDate: String, strCurrentFormateType:String, strFormateType:String) -> NSDate {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strCurrentFormateType
        var strNewdate = NSDate()
        strNewdate = dateFormatter.date(from: strDate)! as NSDate
        dateFormatter.dateFormat = strFormateType;
        var nsdate = NSDate()
        nsdate = dateFormatter.date(from: dateFormatter.string(from: strNewdate as Date))! as NSDate
        return nsdate
    }
    
    func getCurrentDayInt() -> Int
    {
        let date = NSDate()
        let cal = NSCalendar.current
        let day = cal.component(.weekday, from: date as Date)
        return day
    }
    
    func getBeforeDays(days:Int, strDate:String, strFormateType: String) -> String {
        
        let calendar = Calendar(identifier: .gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = strFormateType
        var startDate = NSDate()
        startDate = dateFormatter.date(from: strDate)! as NSDate
        
        var startComponents: DateComponents = calendar.dateComponents([.day, .month, .year], from: startDate as Date)
        startComponents.day! += days
        let endDate: Date? = calendar.date(from: startComponents)
        let endDateStr: String = dateFormatter.string(from: endDate!)
//        print(endDateStr)        
        return endDateStr
    }
    
    
    
    func getBeforeMinuts(minuts:Int, strDate:String, strFormateType: String) -> String {
        
        let calendar = Calendar(identifier: .gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = strFormateType
        var startDate = NSDate()
        startDate = dateFormatter.date(from: strDate)! as NSDate
        
        var startComponents: DateComponents = calendar.dateComponents([.hour, .minute, .day, .month, .year], from: startDate as Date)
        startComponents.minute! += minuts
        let endDate: Date? = calendar.date(from: startComponents)
        let endDateStr: String = dateFormatter.string(from: endDate!)
        return endDateStr
    }
    
    /*
    func getBeforeDateFromDate(days:Int, strDate:String, strFormateType: String) -> NSDate {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strFormateType
        var currentDate = NSDate()
        currentDate = dateFormatter.date(from: strDate)! as NSDate
        let newDate = [currentDate.addingTimeInterval(TimeInterval((-days)*24*60*60))]
        return NSDate()
        
        var tenDaysfromNow: Date {
            return (Calendar.current as NSCalendar).date(byAdding: .day, value: 10, to: Date(), options: [])!
        }
        
        NSDate *now = [NSDate date];
        NSDate *sevenDaysAgo = [now dateByAddingTimeInterval:-7*24*60*60];
        NSLog(@"7 days ago: %@", sevenDaysAgo);
    }
    */
    
}



// MARK: Date Time Formate
struct DateTimeFormate {
    
    static let Formate_yyyyMMddTHHmmssZ = "yyyy-MM-dd\'T\'HH:mm:ss Z"
    
    static let Formate_yyyyMMddHHmmssZ = "yyyy-MM-dd\' \'HH:mm:ss Z"
    
    static let Formate_yyyyMMdd = "yyyy-MM-dd"
    
    static let Formate_yyyyMMddhhmmaa = "yyyy-MM-dd hh:mm aa"
    
    static let Formate_EEEdMMMyyyyathhmmaa = "EEE d MMM, yyyy 'at' hh:mm aa"
    
    static let Formate_EEEdMMMathhmma = "EEE d MMM 'at' hh:mm a"
    
    static let Formate_MMMdathhmma = "MMM d 'at' hh:mm a"
    
    static let Formate_ddMMMathhmma = "dd MMM' at' hh:mm a"
    
    
    
    static let Formate_ddMMyyyyHHmmssZZZ = "dd-MM-yyyy HH:mm:ss ZZZ"
    
    static let Formate_ddMMMyyyyathhmma = "dd MMM, yyyy 'at' hh:mm a"
    
    static let Formate_yyyy = "yyyy"
    
    static let Formate_HHmmss = "HH:mm:ss"
    
    static let Formate_ddMMM = "dd MMM"
    
    static let Formate_hhmmaddMMMyyyy = "hh:mm a dd MMM, yyyy"
    
    static let Formate_ddMMMyyyy = "dd MMM, yyyy"
    
    static let Formate_ddMMyyyhhmmssa = "dd/MM/yyyy hh:mm:ss a" //Android users using this date time format
    
    static let Formate_ddMMyyyy = "dd/MM/yyyy"
    static let Formate_hhmmssa  = "hh:mm:ss a"
    
    static let Formate_ddMMMWithoutCommayyyy = "dd MMM yyyy"
    
    static let Formate_ddMMMWithoutCommayyyyhhmmssa = "dd MMM yyyy, hh:mm:ss a"
    static let Formate_yymmddHHmmssa = "dd/MM/yy, hh:mm:ss a"
    static let Formate_yymmddHmmssa = "dd/MM/yy, h:mm:ss a"
    static let Formate_Email = "yyyy-MM-dd hh:mm:ss ZZZ"
    static let Formate_EmaiyymmddHHmmssa = "dd/MM/yyyy hh:mm:ss a"
    
    
    static let Formate_ddmmyyyyhhmma = "dd/MM/yyyy hh:mm a" //"16/06/2017 12:19 PM" Use this formate for all created and Modified Date. iOS User
    static let Formate_hhmma = "hh:mm a"
    static let Formate_ddmm = "dd/MM"
}


