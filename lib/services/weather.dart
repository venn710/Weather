import '../services/location.dart';
import 'package:climate/services/location.dart';
import '../services/networking.dart';
class WeatherModel {
Future getlocweather() async
{
Location l=Location();  
await l.getLocation();
Network n=Network(lati:l.lat,longi:l.long);
var wet=await n.nethelp();
return wet;
//Navigator.push(context,MaterialPageRoute(builder: (context)=>LocationScreen(wet)));
}



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    }else if(condition==0)
    {
      return "Error finding";
    }

    else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10 && temp!=0) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else if(temp==0)
    {
      return 'Error finding';
    }
    else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
