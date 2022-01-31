import 'package:flutter/material.dart';
import 'package:green_fintech/pages/widgets/app_text.dart';
import 'package:green_fintech/utils/colors.dart';

class SmallCard extends StatelessWidget {
  final String wind;
  final String humid;
  final String visibility;

  const SmallCard(
      {Key? key,
      required this.wind,
      required this.humid,
      required this.visibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(
                Icons.cloud_circle_outlined,
                color: purpleColor,
              ),
              SizedBox(height: 8),
              Text(wind.toString() + "км/ц"),
              AppText(
                text: "Салхи",
                size: 14,
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.cloud,
                color: purpleColor,
              ),
              SizedBox(height: 8),
              Text(humid.toString() + "%"),
              AppText(
                text: "Чийгшил",
                size: 14,
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.cloud,
                color: purpleColor,
              ),
              SizedBox(height: 8),
              Text(visibility.toString()),
              AppText(
                text: "Даралт",
                size: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
