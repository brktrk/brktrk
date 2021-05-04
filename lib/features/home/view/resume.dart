import 'package:brktrk/config.dart';
import 'package:brktrk/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Resume extends StatelessWidget {
  // ignore: non_constant_identifier_names
  var description, title, education, experience, skill_description, skill_title;

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<Config>(context, listen: true);
    config.defaultApi.resumeOptions
        .map((element) => element.resumeName == 'description'
            ? description = element.resumeValue.toString()
            : null)
        .toList();

    config.defaultApi.resumeOptions
        .map((element) => element.resumeName == 'title'
            ? title = element.resumeValue.toString()
            : null)
        .toList();

    config.defaultApi.resumeOptions
        .map((element) => element.resumeName == 'education'
            ? education = element.resumeValue.toString()
            : null)
        .toList();
    config.defaultApi.resumeOptions
        .map((element) => element.resumeName == 'experience'
            ? experience = element.resumeValue.toString()
            : null)
        .toList();
    config.defaultApi.skillOptions
        .map((element) => element.skillName == 'title'
            ? skill_title = element.skillValue.toString()
            : null)
        .toList();
    config.defaultApi.skillOptions
        .map((element) => element.skillName == 'description'
            ? skill_description = element.skillValue.toString()
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
                  style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: secondColor,
                      fontSize: 14),
                ),
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
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          education,
                          style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 26),
                        ),
                        Container(
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: config.defaultApi.education.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  dense: false,
                                  contentPadding:
                                      EdgeInsets.only(left: 0.0, right: 0.0),
                                  title: Card(
                                    color: itemColor,
                                    child: Container(
                                      color: itemColor,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.40,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: double.infinity,
                                            width: 2,
                                            child: const ColoredBox(
                                                color: primaryColor),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 4),
                                                      width: 32,
                                                      height: 32,
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Image.asset(
                                                          'assets/item-arrow.png'),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        config
                                                            .defaultApi
                                                            .education[index]
                                                            .educationTitle,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Regular',
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 32,
                                                      height: 32,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        config
                                                            .defaultApi
                                                            .education[index]
                                                            .educationDetails,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Regular',
                                                            color: secondColor,
                                                            fontSize: 14),
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          experience,
                          style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 26),
                        ),
                        Container(
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: config.defaultApi.experience.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  dense: false,
                                  contentPadding:
                                      EdgeInsets.only(left: 0.0, right: 0.0),
                                  title: Card(
                                    color: itemColor,
                                    child: Container(
                                      color: itemColor,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.40,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: double.infinity,
                                            width: 2,
                                            child: const ColoredBox(
                                                color: primaryColor),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 4),
                                                      width: 32,
                                                      height: 32,
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Image.asset(
                                                          'assets/item-arrow.png'),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        config
                                                            .defaultApi
                                                            .experience[index]
                                                            .experienceTitle,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Regular',
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 32,
                                                      height: 32,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        config
                                                            .defaultApi
                                                            .experience[index]
                                                            .experienceDetails,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Regular',
                                                            color: secondColor,
                                                            fontSize: 14),
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          skill_description,
                          style: TextStyle(color: secondColor, fontSize: 14),
                        ),
                        Text(
                          skill_title,
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 36),
                        ),
                        Container(
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: config.defaultApi.skills.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  dense: true,
                                  contentPadding:
                                      EdgeInsets.only(left: 0.0, right: 0.0),
                                  title: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              config.defaultApi.skills[index]
                                                  .skillInfoName,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins-Regular',
                                                  color: textColor,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              config.defaultApi.skills[index]
                                                      .skillInfoPercantage +
                                                  '%',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins-Regular',
                                                  color: textColor,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: LinearProgressIndicator(
                                              backgroundColor: backgroundColor,
                                              value: double.parse(config
                                                  .defaultApi
                                                  .skills[index]
                                                  .skillInfoPercantage
                                                  .toString()),
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      primaryColor)),
                                          height: 9,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
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
          )
        ],
      ),
    );
  }
}
