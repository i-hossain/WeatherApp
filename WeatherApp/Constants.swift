//
//  Constants.swift
//  WeatherApp
//
//  Created by Ismail Hossain on 2017-04-29.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let CURRENT_CODE = "weather?"
let FORECAST_CODE = "forecast/daily?"
let LAT = "lat="
let LONG = "&lon="
let APP_ID = "&appid="
let API_KEY = ""

let kelvinToCelcius = -273.15

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(CURRENT_CODE)\(LAT)\(Location.sharedInstance.latitude!)\(LONG)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "\(BASE_URL)\(FORECAST_CODE)\(LAT)\(Location.sharedInstance.latitude!)\(LONG)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"


