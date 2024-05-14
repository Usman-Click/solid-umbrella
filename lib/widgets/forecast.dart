import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  final String time, temp;
  final IconData icon;

  const Forecast({super.key,  this.time = "09:00", this.temp = "302.7",  this.icon =  Icons.cloud});
  
  @override
  State<Forecast> createState() => _ForecastState();

}

class _ForecastState extends State<Forecast>{
  late String time, temp;
  late IconData icon;

  @override
  void initState() {
    super.initState();
    time = widget.time;
    icon = widget.icon;
    temp = widget.temp;
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white10,
      margin: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            //side: Borderside
      ),
        child: Container(
          width: 100,
          height: 100,
          child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
            const Icon(Icons.cloud, size: 30,),
            Text(temp)
          ],
        ),
        ),
    );
  }

}