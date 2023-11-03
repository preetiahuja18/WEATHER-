import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/weather.dart';


class LoadingScreen extends StatefulWidget {
 

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


@override
void initState(){
  super.initState();
  getLocation();
 // getData();
}
  void getLocation() async {
    var weatherData= await WeatherModel().getLocationWeather();
    Navigator.push(context,MaterialPageRoute(builder:(context){
   
      return LocationScreen(locationWeather: weatherData,);
   }));
  }
  
@override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:Center(child: SpinKitDoubleBounce(color: Colors.red,
      size: 100.0,),)
     
    );
  }
}
