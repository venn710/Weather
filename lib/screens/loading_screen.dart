import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
@override
void initState()
{
super.initState();
currLocation();
}
void currLocation() async
{
WeatherModel w = WeatherModel();
// print("gotttttttttt");
var qwerty=await w.getlocweather();
// print("got location");
Navigator.push(context,MaterialPageRoute(builder: (context)=>LocationScreen(qwerty)));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SpinKitDoubleBounce(
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}

