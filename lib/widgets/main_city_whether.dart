import 'package:flutter/material.dart';

class MainCityWeather extends StatelessWidget {
  const MainCityWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
            color: Colors.white10,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
            //decoration: ShapeDecoration(shape: Border.all()),
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.all(10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('42.1 Deg', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Icon(Icons.cloud, size: 60,),
                Text('Rain', style: TextStyle(fontSize: 18),),

              ],

            )
    ));
  }
}