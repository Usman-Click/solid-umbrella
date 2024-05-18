import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  final String time, temp;
  final String imgUrl;

const HourlyForecast({super.key,  this.time = "09:00", this.temp = "302.7",  this.imgUrl =  ""});

 @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white10,
      margin: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            //side: Borderside
      ),
        child: SizedBox(
          width: 100,
          height: 100,
          child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time, maxLines: 1, overflow: TextOverflow.ellipsis,),
            Image.network(imgUrl, fit: BoxFit.fill,),
            Text(temp)
          ],
        ),
        ),
    );
  }
}
