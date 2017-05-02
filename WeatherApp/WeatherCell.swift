//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Ismail Hossain on 2017-05-02.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var forecastDayLabel: UILabel!
    @IBOutlet weak var forecastTypeLabel: UILabel!
    @IBOutlet weak var hightTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    
    func updateWeatherCell(forecast: Forecast) {
        
        weatherImage.image = UIImage(named: forecast.weatherType)
        forecastDayLabel.text = forecast.date
        forecastTypeLabel.text = forecast.weatherType
        hightTempLabel.text = "\(forecast.highTemp)°"
        lowTempLabel.text = "\(forecast.lowTemp)°"
        
    }

}
