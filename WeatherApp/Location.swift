//
//  Location.swift
//  WeatherApp
//
//  Created by Ismail Hossain on 2017-05-02.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import Foundation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
