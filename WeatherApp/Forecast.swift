//
//  Forecast.swift
//  WeatherApp
//
//  Created by Ismail Hossain on 2017-05-01.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: Double!
    private var _lowTemp: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var highTemp: Double {
        if _highTemp == nil {
            _highTemp = 0.0
        }
        
        return _highTemp
    }
    
    var lowTemp: Double {
        if _lowTemp == nil {
            _lowTemp = 0.0
        }
        
        return _lowTemp
    }
    
    init(listObject: Dictionary<String, AnyObject> ) {
        
        if let epoch = listObject["dt"] as? Double {
            
            let epochConverted = Date(timeIntervalSince1970: epoch)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE"
            let forecastDate = dateFormatter.string(from: epochConverted)
            
            self._date = forecastDate
        }
        
        if let weather = listObject["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let temp = listObject["temp"] as? Dictionary<String, AnyObject> {
            
            if let max = temp["max"] as? Double {
                let tempCelcius = max + kelvinToCelcius
                self._highTemp = Double(round(tempCelcius * 10)/10)
            }
            
            if let min = temp["min"] as? Double {
                let tempCelcius = min + kelvinToCelcius
                self._lowTemp = Double(round(tempCelcius * 10)/10)
            }
        }
    }
    
}
