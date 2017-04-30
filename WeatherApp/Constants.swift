//
//  Constants.swift
//  WeatherApp
//
//  Created by Ismail Hossain on 2017-04-29.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "65d8d1c76dbc9eef77ade9e2fb00ac2a"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"
