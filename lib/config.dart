import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:brktrk/features/home/model/api.dart';
import 'package:url_launcher/url_launcher.dart';

class Config with ChangeNotifier {
  var baseUrl = 'brktrk.com';
  var imgUrl = 'https://brktrk.com/img/';
  var apiUrl = '/api';
  var itemCount = false;
  late Api defaultApi;
  var headlineKeysArray = [
    TypewriterAnimatedText("I'm a Developer", cursor: "|")
  ];

  void getHttp() async {
    if (!itemCount) {
      var url = Uri.https(baseUrl, apiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        Api api = new Api.fromJson(jsonResponse);
        defaultApi = api;
        getKeys();
        itemCount = true;
        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  void getKeys() {
    headlineKeysArray.clear();
    for (var item in defaultApi.headlineKeys) {
      headlineKeysArray
          .add(TypewriterAnimatedText("I'm " + item.keyValue, cursor: "|"));
    }
  }
}
