import '../screens/city_screen.dart';
import '../screens/loading_screen.dart';
import '../services/weather.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'dart:convert';
import '../services/location.dart';
import '../services/networking.dart';

class LocationScreen extends StatefulWidget {
  final wett;
  LocationScreen(this.wett);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
double tempa;
String city;
int cond;
WeatherModel w1=WeatherModel();
@override
void initState()
{
  super.initState();
  // print(widget.wett);
  updateUI(widget.wett);
}
void updateUI(dynamic wettt)
{
  if(wettt==null)
  {
    cond=0;
    tempa=0.0;
    city='';
  }
  else
  {
cond=jsonDecode(wettt)['weather'][0]['id'];
tempa= (jsonDecode(wettt)['main']['temp']);
city=jsonDecode(wettt)['name'];
// print(cond);
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
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
                    onPressed: () async{
                   //  var weather=await w.getlocweather();
                        Location l=Location();
                        await l.getLocation();
                        Network n=Network(lati:l.lat,longi:l.long);
                        var wet_1=await n.nethelp();
                        setState(() {
cond=jsonDecode(wet_1)['weather'][0]['id'];
tempa= (jsonDecode(wet_1)['main']['temp']);
city=jsonDecode(wet_1)['name'];
// print(cond);
                        });
                        // print(wet_1);
                     // updateUI(weather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var res =await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }
                      ),
                      );
                      if(res!=null)
                      {
                      setState(() {

                      updateUI(res);
                      // print(res);
  
                      });
                      }
                      },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Text(
                     '$tempa°',
                     // widget.wett['main']['temp'], 
                      style: kTempTextStyle,
                    ),
                    Text(
                      w1.getWeatherIcon(cond),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  (city=='')?w1.getMessage(tempa.toInt())+"Refresh":
                  w1.getMessage(tempa.toInt()) + ' in $city',
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