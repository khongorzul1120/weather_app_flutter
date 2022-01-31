import 'package:flutter/material.dart';
import 'package:green_fintech/model/weather_model.dart';
import 'package:green_fintech/pages/widgets/app_text.dart';
import 'package:green_fintech/pages/widgets/rouded_card.dart';
import 'package:green_fintech/pages/widgets/small_card.dart';
import 'package:green_fintech/utils/colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = 0;
  List<Forecastday> detailWeather = [];
  WeatherModel weather = WeatherModel(
      cityName: "",
      temporature: 0.0,
      wind: 0,
      humid: 0,
      visib: 0,
      isDay: 0,
      conText: "Үүлэрхэг");


  String checkCon(int? text) {
    switch (text) {
      case 1000:
        return "assets/images/sun.png";
      case 1006:
        return "assets/images/cloud.png";
      case 1147:
        return "assets/images/snow.png";
      default:
        return "assets/images/sunandcloud.png";
    }
  }
  String checkText(int? text) {
    switch (text) {
      case 1000:
        return "Нартай";
      case 1006:
        return "Үүлэрхэг";
      case 1147:
        return "Цастай";
      default:
        return "Нартай";
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic weather2 = ModalRoute.of(context)?.settings.arguments;
    print("Detail page");
    print(weather2);
    setState(() {
      weather = weather2[0];
      detailWeather = weather2[1];
    });

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: BackButton(color: Colors.black),
            elevation: 0,
            title: Text(
              weather.cityName != "" ? weather.cityName : "",
              style: TextStyle(color: Colors.black),
            )),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white,
                            pinkColor2,
                          ],
                          begin: Alignment(2, -1),
                          end: Alignment(1, 2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 100, left: 30, right: 30),
                        child: CustomRoundedCard(
                          contText:  checkText(weather.conCode).toString(),
                          imageName: checkCon(weather.conCode).toString(),
                          name: weather.cityName,
                          temporature: weather.temporature.toString(),
                        ),
                      ))),
              Positioned(
                  top: 200,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: SmallCard(
                        wind: weather.wind.toString(),
                        humid: weather.humid.toString(),
                        visibility: weather.visib.toString(),
                      ))),
              Positioned(
                  top: 330,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: detailWeather.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(text: detailWeather[index].date.toString().substring(0, 10)),
                                    Row(
                                      children: [
                                        Image.asset(
                                          checkCon(detailWeather[index].contCode).toString(),
                                          width: 50,
                                        ),
                                        AppText(text: checkText(detailWeather[index].contCode).toString())
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        AppText(text: detailWeather[index].max_temporature.toString()),
                                        AppText(text: "/"),
                                        AppText(text: detailWeather[index].min_temporature.toString()),
                                      ],
                                    )
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
