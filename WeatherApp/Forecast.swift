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
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        Alamofire.request(FORECAST_URL).responseJSON() { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    print(list.count)
                }
                
            }
            completed()
        }
    }
    
}
