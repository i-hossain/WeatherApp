//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ismail Hossain on 2017-04-24.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempImage: UIImageView!
    @IBOutlet weak var currentTempTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var forecasts = [Forecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrentWeather(currentWeather: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.locationAuthStatus()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            CurrentWeather.downloadCurrentWeatherData { currentWeather in
                self.updateCurrentWeather(currentWeather: currentWeather)
            }
            WeatherVC.downloadForecastData { forecasts in
                self.forecasts = forecasts
                self.tableView.reloadData()
            }
        }
        else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    class func downloadForecastData(completed: @escaping ([Forecast]) -> ()) {
        Alamofire.request(FORECAST_URL).responseJSON() { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    var forecasts = [Forecast]()
                    
                    for obj in list {
                        let forecast = Forecast(listObject: obj)
                        forecasts.append(forecast)
                    }
                    
                    forecasts.remove(at: 0) // Remove first object as you don't want the current day under forecast
                    completed(forecasts)
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.updateWeatherCell(forecast: forecast)
            return cell
        }
        else {
            
            return WeatherCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func updateCurrentWeather(currentWeather: CurrentWeather?) {
        
        dateLabel.text = currentWeather?.date
        locationLabel.text = currentWeather?.city
        currentTempTypeLabel.text = currentWeather?.weatherType
        
        if let currentWeather = currentWeather {
            currentTempLabel.text = "\(currentWeather.temperature)°"
            currentTempImage.image = UIImage(named: currentWeather.weatherType)
        }
        else {
            currentTempLabel.text = " "
            currentTempImage.image = nil
        }
        
    }

}

