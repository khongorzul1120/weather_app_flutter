import 'package:flutter/material.dart';
import 'package:green_fintech/utils/colors.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String gradus;

  const CustomCard({Key? key, required this.title, required this.gradus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          gradient: LinearGradient(
            colors: [
              purpleColor,
              pinkColor,
              Colors.yellow.shade300,
            ],
            begin: Alignment(2, -1),
            end: Alignment(1, 2),
          ),
        ),
        child: Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
         
         Text(
          gradus,
          style: TextStyle(color: Colors.white, fontSize: 70),
        ),
              ],
            )), //declare your widget here
      ),
    );
  }
}
