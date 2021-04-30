import 'package:brktrk/config.dart';
import 'package:brktrk/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<Config>(context, listen: true);
    config.getHttp();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 3000,
              child: NestedScrollView(
                scrollDirection: Axis.vertical,
                floatHeaderSlivers: false,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      brightness: Brightness.dark,
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      primary: true,
                      pinned: false,
                    ),
                  ];
                },
                body: Center(
                    child: Column(
                      children: [
                        Text(
                          "Showcasing some of my best work",
                          style: TextStyle(color: secondColor, fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Portfolio",
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 36),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: LinearProgressIndicator(
                              backgroundColor: primaryColor,
                              valueColor: AlwaysStoppedAnimation<Color>(backgroundColor)),
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
                                  child: Container(
                                    child: TabBarView(
                                      children: config.subTabMaker(context),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 200,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
