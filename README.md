# WeatherApp
A simple app that displays the current weather information and weekly forecasts based on user's location.

# Environment setup
- Update Xcode to the latest version
- Install cocoapods:
	
	`gem install cocoapods`

# Build and Run
- Install pods
	
	```
	cd WeatherApp/
	pod install
	```
-	Go to https://home.openweathermap.org/ and sign up for an API KEY
- Paste the API key in the "Constants" file. The file should now have a line similar to:

	`API_KEY = "b1b15e88fa797225412429c1c50c122a1"`
- Run the app on a device or simulator and you should now be able to view weather details based on your location
