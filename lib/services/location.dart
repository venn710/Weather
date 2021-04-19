// import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
 class Location
 {
   double lat;
   double long;
  Future<void>getLocation() async
   {
     try
     {
  // print("came to try");
  var position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // print(position);
  lat=position.latitude;
  long=position.longitude;
  // print(long);
  // print(lat);
     }
     catch(e)
    {
      print(e);
    }
   }
   }