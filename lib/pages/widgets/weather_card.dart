import 'package:flutter/material.dart';
import 'package:green_fintech/pages/widgets/card.dart';

class WeatherCard extends StatefulWidget {
  final String name;
  final String temporature;
  final String imageName;

  const WeatherCard({Key? key, required this.name, required this.temporature , required this.imageName})
      : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(overflow: Overflow.visible, children: [
      CustomCard(title: widget.name, gradus: "${widget.temporature}\u00B0"),
      Positioned(
          left: 68,
          top: -14,
          child: Container(
            padding: EdgeInsets.only(top: 8, right: 10, left: 10, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Text("Monday 12, June"),
          )),
      Positioned(
          left: 30,
          top: 145,
          child: Image.asset(
            widget.imageName.toString(),
            width: 220,
          )),
    ]);
  }
}
