import 'package:flutter/material.dart';
import 'package:soild_umbrella/widgets/forecast.dart';

class MainForecast extends StatelessWidget {
  const MainForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Weather Forecast", style: 
        TextStyle(fontWeight: FontWeight.w500, fontSize: 20 )),
         Row(children: [Forecast(),Forecast(),Forecast(),Forecast(),],)


      ],
    );
  }
}