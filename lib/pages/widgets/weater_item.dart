import 'package:flutter/material.dart';
import 'package:green_fintech/pages/widgets/app_text.dart';
import 'package:green_fintech/utils/colors.dart';

class WeatherItem extends StatelessWidget {
  final double temporature;
  final String time;
  final int isDay;
  const WeatherItem({Key? key, required this.temporature, required this.time, required this.isDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            purpleColor,
            pinkColor,
            Colors.yellow.shade300,
          ],
          begin: Alignment(4, -1),
          end: Alignment(1, 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppText(text:temporature.toString(), color: Colors.white,),
          Image.asset(
            "assets/images/sunandcloud.png",
            width: 50,
          ),
          AppText(text: isDay.toString() == "0" ? time.toString().substring(11, 16) +"am": time.toString().substring(11, 16)+"pm", color: Colors.white, size: 12,),
        ],
      ),
    );
  }
}
