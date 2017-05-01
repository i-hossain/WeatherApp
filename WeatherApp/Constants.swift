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
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "65d8d1c76dbc9eef77ade9e2fb00ac2a"

let kelvinToCelcius = -273.15
let cityLatitutde = "43.700111"
let cityLongitude = "-79.416298"


typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(CURRENT_CODE)\(LATITUDE)\(cityLatitutde)\(LONGITUDE)\(cityLongitude)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "\(BASE_URL)\(FORECAST_CODE)\(LATITUDE)43.700111\(LONGITUDE)-79.416298\(APP_ID)\(API_KEY)"

