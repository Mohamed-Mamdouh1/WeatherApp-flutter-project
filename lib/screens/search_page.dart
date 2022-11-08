// ignore_for_file: use_build_context_synchronously, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/models/weathre_Provider.dart';
import '../services/weather_service.dart';

WeatherModel? weatherData;

class SearchPage extends StatelessWidget {
  // SearchPage({required this.updateUi});
  // VoidCallback? updateUi;
  String? data;
  String? CityName;

  SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        shadowColor: Colors.white,
        title: const Text(
          "Search a City",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onChanged:(data){ CityName=data;},
            onSubmitted: (data) async {
              this.data = data;
              CityName = data;
              CityName = data;
              WeatherService weather = WeatherService();
              WeatherModel? Weather =
                  await weather.getWeather(CityName: CityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  Weather;
              //updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: "Enter Your City",
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {

                   WeatherService weather = WeatherService();
                   WeatherModel? Weather =await weather.getWeather(CityName: CityName!);
                   WidgetsFlutterBinding.ensureInitialized();
                   // print(Weather);
                   Provider.of<WeatherProvider>(context,listen: false).weatherData=Weather;
                  // updateUi!();
                   Navigator.pop(context);
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              border: const OutlineInputBorder(),
              label: const Text(
                "Search",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
