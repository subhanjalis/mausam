import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    WeatherModel weatherModel= WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,
      );
    }),
    );


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SpinKitSquareCircle(
            color: Colors.lightBlueAccent,
            size: 50.0,
          ),
        ),
        SizedBox(width: 20.0, height: 60.0,),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("  मौसम। अपने स्थानीय मौसम को देखने के लिए एक ऐप!  ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
      ],
    ),
    );
  }
}

// print(temperature);
// print(condition);
// print(cityName);