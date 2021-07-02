import 'package:clima/screens/forecast_screen.dart';
import 'package:clima/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
   LocationScreen({this.locationWeather});
   final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  int temperatureMin;
  int temperatureMax;
  int feelsLike;
  int humidity;
  String weatherIcon;
  String cityName;
  String message;
  String what;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null){
        temperature=0;
        weatherIcon='Error';
        weatherData='Unable to get weather data';
        cityName='';
        message="";
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      double tempMin = weatherData['main']['temp_min'];
      temperatureMin = tempMin.toInt();
      double tempMax = weatherData['main']['temp_max'];
      temperatureMax = tempMax.toInt();
      double feelLike = weatherData['main']['feels_like'];
      feelsLike = feelLike.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon=weather.getWeatherIcon(condition);
      what = weatherData['weather'][0]['main'];
      cityName = weatherData['name'];
      int humid = weatherData['main']['humidity'];
      humidity = humid;
      print(humid);
      message = weather.getMessage(temperature);
    });
     }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var currentTime = new DateTime(now.hour).toString().substring(10, 13);
    var ct = int.parse(currentTime);
    return Scaffold(backgroundColor: ct>16?Colors.blueGrey.shade50:Colors.blueGrey.shade900,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(((ct>16 && ct<23) || (ct<6 && ct>=0))?'images/night.jpg':'images/morning.JPG'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      print(weatherData['coord']['lon']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapScreen(lat: weatherData['coord']['lat'],lon: weatherData['coord']['lon']),
                        ),
                      );
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var weatherData= await weather.getForecast();
                      print(weatherData['list'].runtimeType);
                      List<dynamic> forecastData=weatherData['list'];
                      var typedName= await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForecastScreen(forecast: forecastData,),
                        ),
                      );

                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                    Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 3.0,
                              )
                          ),

                          Text(
              ' $what ',
              style: kTempTextStyle,
            ),
                          Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 3.0,
                              )
                          ),
                        ]
                    ),
                    Text(
                      'Current: $temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      'Feels like: $feelsLike°',
                      style: kTempTextStyle,
                    ),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          ' Min: $temperatureMin°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          'Max: $temperatureMax° ',
                          style: kTempTextStyle,
                        ),
                      ],
                    ),
                    Text(
                      'Humidity: $humidity%',
                      style: kTempTextStyle,
                    ),

                  ],

                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "$message kind of weather in $cityName!",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
