import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:soild_umbrella/keys/encryptions.dart';
import 'package:http/http.dart' as http;
import 'package:soild_umbrella/widgets/hourly_forecast.dart';
import 'package:soild_umbrella/widgets/main_forecast.dart';
import 'package:soild_umbrella/widgets/more_info.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final String city = "gombe";
  late Future<Map<String, dynamic>> weatherData;

  @override
  void initState() {
    super.initState();
    try {
      // call the API to get the init data
      weatherData = getData();
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> getData() async {
    // ignore: prefer_interpolation_to_compose_strings
    final res = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=" +
            Encryptions.OPEN_WEATHER_KEY));

    switch (res.statusCode) {
      case 401:
        throw ("Invalid request / Invalid API Key");
      case 200:
        try {
          return jsonDecode(res.body);
        } catch (e) {
          // will return an error if we have it, instead of a func
          throw ("Invalid Datatype, \nuse a dynamic if you're not sure of what will be return");
        }
      default:
        throw ("Unexpexted error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Whether App"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  // call the API again to update the data
                  weatherData =
                      getData(); // TODO This can produce error (maybe add try-block)
                });
              },
              icon: const Icon(Icons.refresh))
        ],
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
            future: weatherData, // the snapshot
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                // Error
                return const Text(
                    "We have erroe loading your data, try again letter");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                // Loading...
                return const CircularProgressIndicator.adaptive();
              }

              // we have to make the data non null here b4 we can access the data nd since we verify we have data then fine
              final data = snapshot.data!;
              final currentWeather = data["list"][0];

              String currentImg = currentWeather['weather'][0]['icon'];
              currentImg = currentImg.replaceFirst("d", "n");

              // print(currentImg);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Forecast
                  MainForecast(
                    deg: currentWeather["main"]["temp"],
                    imgUrl:
                        "https://openweathermap.org/img/wn/$currentImg@2x.png",
                    label: currentWeather['weather'][0]['description'],
                  ),
                  const SizedBox(height: 20),

                  // Hourly Forecast
                  const Text("Weather forecast",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          final date =
                              DateTime.parse(data["list"][index + 1]["dt_txt"]);
                          final time = DateFormat.Hm().format(date);

                          return HourlyForecast(
                              temp: data["list"][index + 1]["main"]["temp"]
                                  .toString(),
                              imgUrl:
                                  "https://openweathermap.org/img/wn/${data["list"][index + 1]["weather"][0]["icon"]}.png",
                              time: time);
                        }),
                  ),

                  const SizedBox(height: 20),

                  // More Info
                  const Text("Additional info",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MoreInfo(
                            label: "Humidity",
                            icon: Icons.water_drop,
                            val: data["list"][0]["main"]["humidity"].toString(),
                          ),
                          MoreInfo(
                            label: "Wind speed",
                            icon: Icons.directions_bike_sharp,
                            val: data["list"][0]["wind"]["speed"].toString(),
                          ),
                          MoreInfo(
                            label: "Pressure",
                            icon: Icons.beach_access_outlined,
                            val: data["list"][0]["main"]["pressure"].toString(),
                          ),
                        ]),
                  )
                ],
              );
            }),
      ),
    );
  }
}
