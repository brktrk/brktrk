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

  double screenWidth = 10;
  double screenHeight = 10;

  setScreenSize(context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

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

  List<Tab> tabMaker() {
    List<Tab> tabs = [];
    tabs.clear();
    tabs.add(Tab(text: "All"));
    for (var item in defaultApi.portfolioCategories) {
      tabs.add(Tab(text: item.categoryName));
      print(item.categoryName);
    }
    return tabs;
  }

  List<Container> subTabMaker(context) {
    List<Container>? tabs = [];
    tabs.clear();
    late List<Portfolio> currentPortfolio = [];
    defaultApi.portfolio.map((e) => currentPortfolio.add(e)).toList();
    tabs.add(
      Container(
        child: GridView.builder(
            primary: false,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: currentPortfolio.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    _launchURL(currentPortfolio[index].portfolioUrl);
                  },
                  child: Image(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          imgUrl + currentPortfolio[index].portfolioImage)),
                ),);
            }),
      ),
    );
    List<List<Portfolio>> portfolio;
    portfolio =
        List.generate(defaultApi.portfolioCategories.length, (counter) => []);
    defaultApi.portfolioCategories.asMap().forEach((key, cat) {
      defaultApi.portfolio.asMap().forEach((index, value) =>
          value.categoryName == cat.categoryName
              ? portfolio[key].add(value)
              : null);
      tabs.add(
        Container(
          child: GridView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemCount: portfolio[key].length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        _launchURL(portfolio[key][index].portfolioUrl);
                      },
                      child: Image(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              imgUrl + portfolio[key][index].portfolioImage)),
                    ));
              }),
        ),
      );
    });
    return tabs;
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
