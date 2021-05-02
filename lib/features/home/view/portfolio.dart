import 'package:brktrk/config.dart';
import 'package:brktrk/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Portfolio extends StatelessWidget {
  var description,
      title;
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
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        floatHeaderSlivers: false,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
          ];
        },
        body: Center(
            child: Column(
          children: [
            SizedBox(height: 80,),
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
            Expanded(
              child: DefaultTabController(
                length: config.defaultApi.portfolioCategories.length + 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints.expand(height: 50),
                      child: Center(
                        child: TabBar(
                          isScrollable: true,
                          tabs: config.tabMaker(),
                          indicatorColor: primaryColor,
                          unselectedLabelColor: Colors.white,
                          labelColor: primaryColor,
                          indicatorWeight: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: config.subTabMaker(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
