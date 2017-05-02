//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ismail Hossain on 2017-04-24.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempImage: UIImageView!
    @IBOutlet weak var currentTempTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    var forecasts = [Forecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadCurrentWeatherData {
            self.downloadForecastData {
                self.updateCarousel()
            }
        }
        
        self.downloadForecastData {
            // Code to update tableview
        }
        
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        Alamofire.request(FORECAST_URL).responseJSON() { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(listObject: obj)
                        self.forecasts.append(forecast)
                    }
                }
                
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func updateCarousel() {
        dateLabel.text = currentWeather.date
        locationLabel.text = currentWeather.city
        currentTempLabel.text = "\(currentWeather.temperature)°"
        currentTempTypeLabel.text = currentWeather.weatherType
        currentTempImage.image = UIImage(named: currentWeather.weatherType)
    }

}

