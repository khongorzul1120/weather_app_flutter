import 'package:flutter/material.dart';
import 'package:green_fintech/pages/widgets/app_text.dart';
import 'package:green_fintech/utils/colors.dart';

class CustomRoundedCard extends StatefulWidget {
  final String name;
  final String temporature;
  final String imageName;
  final String contText;
  const CustomRoundedCard(
      {Key? key,
      required this.name,
      required this.contText,
      required this.temporature,
      required this.imageName})
      : super(key: key);

  @override
  _CustomRoundedCardState createState() => _CustomRoundedCardState();
}

class _CustomRoundedCardState extends State<CustomRoundedCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            purpleColor,
            pinkColor,
            Colors.yellow.shade300,
          ],
          begin: Alignment(1, -2),
          end: Alignment(-1, 2),
        ),
      ),
      child: Center(
          child: Row(
        children: [
          Image.asset(
            widget.imageName,
            width: 150,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: widget.name,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  AppText(
                    text: widget.temporature + "\u00B0",
                    size: 45,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  AppText(
                    text: widget.contText,
                    color: Colors.white,
                  ),
                 
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
