import 'dart:convert';
import 'package:green_fintech/model/weather_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<WeatherModel> getBooks(String query) async {
    print("Ene bol query");
    print(query);
    var upperCaseText = query[0].toUpperCase() + query.substring(1).toLowerCase();
    final url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=Apikyey=${upperCaseText}&days=5&aqi=yes&alerts=no');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic books = json.decode(response.body);
      print(response.statusCode);
      print(books);

      return WeatherModel.fromJson(books);
    } else {
      throw Exception();
    }
  }

  static Future<List<Hour>> getWeatherHours(String query) async {
    var upperCaseText = query[0].toUpperCase() + query.substring(1).toLowerCase();
    final url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=Apikey&q=${upperCaseText}&days=5&aqi=yes&alerts=no');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic books = json.decode(response.body);
      Iterable book = books['forecast']['forecastday'][0]['hour'];
      print(response.statusCode);
      List<Hour> cateList = [];
      print(books);

      // return books.map((json) => Book.fromJson(json)).where((book) {
      //   final titleLower = book.title.toLowerCase();
      //   final authorLower = book.author.toLowerCase();
      //   final searchLower = query.toLowerCase();

      //   return titleLower.contains(searchLower) ||
      //       authorLower.contains(searchLower);
      // }).toList();

      cateList = book.map((data) => Hour.fromJson(data)).toList();
      return cateList;
    } else {
      throw Exception();
    }
  }

  static Future<List<Forecastday>> getWeatherWeek(String query) async {
        var upperCaseText = query[0].toUpperCase() + query.substring(1).toLowerCase();
    final url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=Apikey&q=${upperCaseText}&days=5&aqi=yes&alerts=no');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic books = json.decode(response.body);
      Iterable book = books['forecast']['forecastday'];
      print(response.statusCode);
      List<Forecastday> cateList = [];
      print(books);

      // return books.map((json) => Book.fromJson(json)).where((book) {
      //   final titleLower = book.title.toLowerCase();
      //   final authorLower = book.author.toLowerCase();
      //   final searchLower = query.toLowerCase();

      //   return titleLower.contains(searchLower) ||
      //       authorLower.contains(searchLower);
      // }).toList();

      cateList = book.map((data) => Forecastday.fromJson(data)).toList();
      return cateList;
    } else {
      throw Exception();
    }
  }
}
