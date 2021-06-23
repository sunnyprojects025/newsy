import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Detailsprovider with ChangeNotifier {
  List topdetails = [];
  Future<dynamic> topheadline() async {
    try {
      topdetails = [];
      final url =
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=8498bb92ecc748fbb33cc035e88479e9';

      final response = await http.get(Uri.parse(url));

      final responseData = await json.decode(response.body);
      topdetails = await responseData['articles'];
      return topdetails;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  List everydetails = [];
  Future<dynamic> everyDetails() async {
    try {
      topdetails = [];
      final url =
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=8498bb92ecc748fbb33cc035e88479e9';

      final response = await http.get(Uri.parse(url));

      final responseData = await json.decode(response.body);
      everydetails = await responseData['articles'];
      return everydetails;
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
