import 'package:flutter/material.dart';
import 'package:green_fintech/model/book.dart';
import 'package:green_fintech/model/weather_model.dart';
import 'dart:async';
import 'package:green_fintech/pages/widgets/app_text.dart';
import 'package:green_fintech/pages/widgets/search_custom.dart';
import 'package:green_fintech/pages/widgets/small_card.dart';
import 'package:green_fintech/pages/widgets/weater_item.dart';
import 'package:green_fintech/pages/widgets/weather_card.dart';
import 'package:green_fintech/router/routes.dart';
import 'package:green_fintech/services/book_api.dart';
import 'package:green_fintech/utils/colors.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  List<Book> books = [];
  String query = 'Ulaanbaatar';
  Timer? debouncer;
  List<Hour> hourWeather = [];
  List<Forecastday> detailWeather = [];
  WeatherModel weather = WeatherModel(
      cityName: "",
      temporature: 0.0,
      wind: 0,
      humid: 0,
      visib: 0,
      isDay: 0,
      conText: "Үүлэрхэг");

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

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

  Future init() async {
    weather = await Api.getBooks(query);
    hourWeather = await Api.getWeatherHours(query);
    detailWeather = await Api.getWeatherWeek(query);
    print("Response ----------------------------");
    print(weather.cityName);
    print(weather.temporature);
    setState(() {
      this.weather = weather;
      this.hourWeather = hourWeather;
      this.detailWeather = detailWeather;
    });
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future searchBook(String query) async => debounce(() async {
        print(query);
        final weather = await Api.getBooks(query);
        final hourWeather = await Api.getWeatherHours(query);
        final detailWeather = await Api.getWeatherWeek(query);
        print("New weather");
        print(books);
        if (!mounted) return;

        setState(() {
          this.query = query;
          this.weather = weather;
          this.hourWeather = hourWeather;
          this.detailWeather = detailWeather;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            child: SearchWidget(
              text: query,
              hintText: 'Search',
              onChanged: searchBook,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: demo(
                    weather.cityName,
                    weather.temporature,
                    checkCon(weather.conCode),
                    weather.wind,
                    weather.humid,
                    weather.visib)),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: "Өнөөдөр"),
                      GestureDetector(
                        onTap: () {
                          print("Daataa pass");
                          print(weather.cityName);
                          Navigator.pushNamed(context, Routes.DetailPage,
                              arguments: [weather, detailWeather]);
                        },
                        child: Row(
                          children: [
                            AppText(
                              text: "Дараагийн 7 өдөр",
                            ),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    width: double.maxFinite,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: hourWeather.length,
                        itemBuilder: (_, index) {
                          return Container(
                              margin: EdgeInsets.only(right: 20),
                              child: WeatherItem(
                                  temporature: hourWeather[index].temporature,
                                  time: hourWeather[index].time,
                                  isDay: hourWeather[index].isDay));
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget demo(String cityName, double temporature, String imageName, double wind,
        int humid, double visib) =>
    Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
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
                child: Container(
                    padding: EdgeInsets.only(top: 80),
                    width: 300.0,
                    height: 450.0,
                    child: Center(
                      child: Container(
                          height: 450.0,
                          child: WeatherCard(
                            imageName: imageName,
                            name: cityName,
                            temporature: temporature.toString(),
                          )),
                    ))),
            Container(height: 20.0),
          ],
        ),
        Column(children: <Widget>[
          Container(height: 370.0),
          Center(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: SmallCard(
                    wind: wind.toString(),
                    humid: humid.toString(),
                    visibility: visib.toString(),
                  )))
        ]),
      ],
    );
