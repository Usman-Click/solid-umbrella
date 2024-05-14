import 'package:flutter/material.dart';
import 'package:soild_umbrella/widgets/main_city_whether.dart';
import 'package:soild_umbrella/widgets/main_forecast.dart';

class MainWheatherPage extends StatefulWidget{
  const MainWheatherPage({super.key});
  
  @override
  State<MainWheatherPage> createState() => MainWheatherPageState();

}

class MainWheatherPageState extends State<MainWheatherPage>{
  
  @override
  Widget build(BuildContext context){
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Whether App"),
          actions:const [
            Icon(Icons.refresh_rounded)
          ],
          centerTitle: true,

        ) ,

        body: Center(
          child: Container(
            //decoration: ShapeDecoration(shape: Border.all()),
            padding: const EdgeInsets.all(10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 MainCityWeather(),
                 SizedBox(height: 20,),
                 MainForecast(),
                

              ],

            ),
          ),
        ),
    );
  }

}