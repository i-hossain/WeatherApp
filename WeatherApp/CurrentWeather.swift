//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Ismail Hossain on 2017-04-29.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    private var _city: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemperature: Double!
    
    var city: String {
        if _city == nil {
            _city = ""
        }
     return _city
    }
    
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
    
    var temperature: Double {
        if _currentTemperature == nil {
            _currentTemperature = 0.0
        }
        return _currentTemperature
    }
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today, \(currentDate)"
    }
    
    func downloadCurrentWeatherData(completed: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._city = name
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        let tempCelcius = temp + kelvinToCelcius
                        self._currentTemperature = Double(round(tempCelcius*10)/10)
                    }
                }
                
            }
            completed()
        }
        
    }
}
