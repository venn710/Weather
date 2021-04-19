import 'package:http/http.dart';
import '../utilities/constants.dart';
class Network
{
  String descr;
  double tempa;
  double lati;
  double longi;
  Network({this.lati,this.longi});
Future nethelp() async
{ 
try
{
// Response res=await get(Uri.encodeFull('https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$longi&appid=$apikey&units=Metric'));
var res=await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$longi&appid=$apikey&units=Metric'));
if(res.statusCode==200)
{  
  String data=res.body;
   return data;
}
else{
  print(res.statusCode);
}
}
catch(e)
{
  print(e);
  }
}
Future cont(String cityname) async
{
  try{
  // Response res1=await get('https://api.openweathermap.org/data/2.5/weather?q=$cityname &appid=$apikey&units=Metric');
  var res1=await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname &appid=$apikey&units=Metric'));
  return res1.statusCode==200?res1.body:print(res1.statusCode);
  }
  catch(e)
  {
    print(e);
  }
}
}