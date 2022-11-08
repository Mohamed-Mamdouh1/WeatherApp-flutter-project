import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/models/weathre_Provider.dart';

import 'package:weather_app/screens/search_page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  // void updateUi(){
  //   setState(() {
  //
  //   });
  // }
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ));
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
          title: const Text(
            "Weather App",
          ),
        ),
        body: weatherData == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "There is no Weather 🙁 ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        'Start searching now 🔎',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SearchPage();
                          }),
                        );
                      },
                    ),
                  ],
                ),
              )
            : Center(
                child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  weatherData!.getTheme(),
                  weatherData!.getTheme()[300]!,
                  weatherData!.getTheme()[200]!,
                  weatherData!.getTheme()[100]!,
                ],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
                child: Column(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      "${weatherData!.CityName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                     Text(
                      "Updated at : ${weatherData!.date}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage().toString()),
                        Text(
                          "${weatherData!.avgTemp!.toInt()}",
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Column(
                          children: [
                            Text("min : ${weatherData?.minTemp?.toInt()}"),
                            Text("max : ${weatherData?.maxTemp?.toInt()}"),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      weatherData!.condition.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    )
                  ],
                ),
              )));
  }
}
