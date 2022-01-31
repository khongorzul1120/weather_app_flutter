class WeatherModel {
  final String cityName;
  final double temporature;
  final double wind;
  final int humid;
  final double visib;
  final int isDay;
  final String conText;
  final int? conCode;

  // final List<Hour> hours;

  const WeatherModel(
      {required this.cityName,
      required this.temporature,
      required this.wind,
      required this.humid,
      this.conCode,
      required this.isDay,
      required this.conText,
      required this.visib});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['location']['name'],
        temporature: json['current']['temp_c'],
        wind: json['current']['wind_kph'],
        humid: json['current']['humidity'],
        isDay: json['current']['is_day'],
        conText: json['current']['condition']['text'],
        visib: json['current']['pressure_mb'],
        conCode: json['current']['condition']['code'],
      );
}

class Hour {
  final double temporature;
  final String time;
  final int isDay;
  const Hour(
      {required this.time, required this.temporature, required this.isDay});

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
      time: json['time'], temporature: json['temp_c'], isDay: json['is_day']);

  get length => null;
}

class Forecastday {
  final double min_temporature;
  final double max_temporature;
  final String date;
  final int? contCode;
  final String? contText;

  const Forecastday(
      {required this.date,
      this.contCode,
      required this.min_temporature,
this.contText,
      required this.max_temporature});

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
      date: json['date'],
      max_temporature: json['day']['maxtemp_c'],
      contCode: json['day']['condition']['code'],
      contText: json['day']['condition']['text'],
      min_temporature: json['day']['mintemp_c']);

  get length => null;
}
