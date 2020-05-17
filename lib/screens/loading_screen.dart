import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/location.dart';
import 'dart:convert';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
@override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }
   void getLocation() async{
    Location location=Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

   }

   void getData()async{
    http.Response response=await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if(response.statusCode==200) {
      String data = response.body;
      print(data);
      var decodeData=jsonDecode(data);

     double temp=decodeData['main']['temp'];
     int conditionno=decodeData['weather'][0]['id'];
     String city=decodeData['name'];
     print(temp);
     print(conditionno);
     print(city);
    }
    else
      print(response.statusCode);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
