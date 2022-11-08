

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathre_Provider.dart';
import 'package:weather_app/screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(

      create: (context) {
        return WeatherProvider();
      },
      child: Weather_app()));
}

class Weather_app extends StatelessWidget {
  const Weather_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primarySwatch:Provider.of<WeatherProvider>(context).weatherData?.getTheme()),
      home: Home_Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
