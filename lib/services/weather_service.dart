import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  WeatherModel? Weather;
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = '73aa51cdfb4f4886bb7130249221808';
  Future<WeatherModel?> getWeather({required String CityName}) async {
    try {
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$CityName&days=1&aqi=no&alerts=no');

      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      // var jsonTop = data["location"];
      // var jsonTemp = data["forecast"]["forecastday"][0]['day'];
      // var jsonCon = data["forecast"]["forecastday"][0]['condition'];
      // WeatherModel weather = WeatherModel(
      //   date: jsonTop["localtime"],
      //   avgTemp: jsonTemp["avgtemp_c"],
      //   minTemp: jsonTemp["mintemp_c"],
      //   maxTemp: jsonTemp["maxtemp_c"],
      //   condition: jsonCon['text'],
      //   CityName: jsonTop['name'],
      // );
      Weather = WeatherModel.fromJson(data);
    } catch (e) {
      print("no city name");
    }
    return Weather;
  }
}
