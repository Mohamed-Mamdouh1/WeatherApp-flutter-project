import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_page.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherModel {
  String? CityName;
  String? date;
  double? avgTemp;
  double? maxTemp;
  double? minTemp;
  String? condition;

  // WeatherModel({
  //   required this.date,
  //   required this.avgTemp,
  //   required this.minTemp,
  //   required this.maxTemp,
  //   required this.condition,
  //   required this.CityName,
  // });
  WeatherModel.fromJson(dynamic data) {
    var jsonTop = data["location"];
    var jsonTemp = data["forecast"]["forecastday"][0]['day'];
    var jsonCon = data["forecast"]["forecastday"][0]["hour"][0]['condition'];
    CityName = jsonTop["name"];
    date = jsonTop["localtime"];
    avgTemp = jsonTemp["avgtemp_c"];
    minTemp = jsonTemp["mintemp_c"];
    maxTemp = jsonTemp["maxtemp_c"];
    condition = jsonCon['text'];
  }
  @override
  String toString() {
    // TODO: implement toString
    return "date =$date \n avgTemp=$avgTemp \n $condition \n $CityName";
  }

  String? getImage() {
    if (condition == "Clear" || condition == 'Sunny') {
      return 'asset/image/clear.png';
    } else if (condition == 'Partly cloudy' ||
        condition == 'Patchy rain possible' ||
        condition == 'Overcast' ||
        condition == 'Cloudy' ||
        condition == 'Mist') {
      return "asset/image/cloudy.png";
    } else if (condition == "Light drizzle" ||
        condition == "Light rain shower" ||
        condition == "Light rain shower" ||
        condition == "Light rain shower" ||
        condition == "Moderate rain") {
      return "asset/image/rainy.png";
    } else if (condition == "Snow") {
      return 'asset/image/snow.png';
    } else {
      return 'asset/image/thunderstorm.png';
    }
  }
  MaterialColor getTheme() {
    if (condition == "Clear" || condition == 'Sunny') {
      return Colors.orange;
    } else if (condition == 'Partly cloudy' ||
        condition == 'Patchy rain possible' ||
        condition == 'Overcast' ||
        condition == 'Cloudy' ||
        condition == 'Mist') {
      return Colors.blueGrey;
    } else if (condition == "Light drizzle" ||
        condition == "Light rain shower" ||
        condition == "Light rain shower" ||
        condition == "Light rain shower" ||
        condition == "Moderate rain") {
      return Colors.blue;
    } else if (condition == "Snow") {
      return Colors.lightBlue;
    } else {
      return Colors.grey;
    }
  }
}
