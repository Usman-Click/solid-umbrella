import 'package:flutter/material.dart';

class MainForecast extends StatelessWidget {
  final double deg;
  final String label;
  final String imgUrl;
  const MainForecast({super.key, this.deg = 43.2, this.label = "Rain", 
  this.imgUrl = "https://openweathermap.org/img/wn/10d@2x.png"});

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
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$deg Deg', 
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Image.network(imgUrl),
                Text(label[0].toUpperCase() + label.substring(1), style: const TextStyle(fontSize: 18),),

              ],

            )
    ));
  }
}