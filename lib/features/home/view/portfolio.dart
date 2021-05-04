import 'package:brktrk/config.dart';
import 'package:brktrk/constants.dart';
import 'package:brktrk/features/home/model/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class PortfolioPage extends StatelessWidget {
  var description, title;

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<Config>(context, listen: true);
    config.defaultApi.portfolioOptions
        .map((element) => element.portfolioName == 'description'
            ? description = element.portfolioValue.toString()
            : null)
        .toList();

    config.defaultApi.portfolioOptions
        .map((element) => element.portfolioName == 'title'
            ? title = element.portfolioValue.toString()
            : null)
        .toList();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  description,
                  style: TextStyle(color: secondColor, fontSize: 14),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 36),
                ),
                SizedBox(height: 20),
                Container(
                  child: LinearProgressIndicator(
                      backgroundColor: backgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor)),
                  width: 75,
                  height: 4,
                ),
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: DefaultTabController(
                    length: config.defaultApi.portfolioCategories.length + 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints.expand(height: 50),
                          child: Center(
                            child: TabBar(
                              isScrollable: true,
                              tabs: tabMaker(config),
                              indicatorColor: primaryColor,
                              unselectedLabelColor: Colors.white,
                              labelColor: primaryColor,
                              indicatorWeight: 1,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: subTabMaker(context,config),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: SizedBox(
              child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  List<Tab> tabMaker(config) {
    List<Tab> tabs = [];
    tabs.clear();
    tabs.add(Tab(text: "All"));
    for (var item in config.defaultApi.portfolioCategories) {
      tabs.add(Tab(text: item.categoryName));
    }
    return tabs;
  }

  List<Container> subTabMaker(context, config) {
    List<Container>? tabs = [];
    tabs.clear();
    late List<Portfolio> currentPortfolio = [];
    config.defaultApi.portfolio.map((e) => currentPortfolio.add(e)).toList();
    tabs.add(
      Container(
        child: GridView.builder(
            primary: false,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
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
                      image: CachedNetworkImageProvider(config.imgUrl +
                          currentPortfolio[index].portfolioImage)),
                ),
              );
            }),
      ),
    );
    List<List<Portfolio>> portfolio;
    portfolio = List.generate(
        config.defaultApi.portfolioCategories.length, (counter) => []);
    config.defaultApi.portfolioCategories.asMap().forEach((key, cat) {
      config.defaultApi.portfolio.asMap().forEach((index, value) =>
          value.categoryName == cat.categoryName
              ? portfolio[key].add(value)
              : null);
      tabs.add(
        Container(
          child: GridView.builder(
              primary: false,
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
                          image: CachedNetworkImageProvider(config.imgUrl +
                              portfolio[key][index].portfolioImage)),
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
