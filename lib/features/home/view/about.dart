import 'package:brktrk/config.dart';
import 'package:brktrk/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class About extends StatelessWidget {
  // ignore: non_constant_identifier_names
  var description, title, content_subtitle, content_title, content_description, skill_title, skill_description, name, mail, age, from, cv, info_img;

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<Config>(context, listen: true);
    config.defaultApi.skillOptions
        .map((element) => element.skillName == 'description'
            ? skill_description = element.skillValue.toString().trim()
            : null)
        .toList();

    config.defaultApi.skillOptions
        .map((element) => element.skillName == 'title'
            ? skill_title = element.skillValue.toString().trim()
            : null)
        .toList();
    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'content_subtitle'
            ? content_subtitle = element.aboutValue.toString()
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'description'
            ? description = element.aboutValue.toString().trim()
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'title'
            ? title = element.aboutValue.toString().trim()
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'content_title'
            ? content_title = element.aboutValue.toString()
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'content_description'
            ? content_description = element.aboutValue.toString()
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'name'
            ? name = element.aboutValue.toString()
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'mail'
            ? mail = element.aboutValue.toString()
            : null)
        .toList();
    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'age'
            ? age = int.parse(DateTime.now().year.toString()) -
                int.parse(element.aboutValue.toString())
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'from'
            ? from = element.aboutValue.toString()
            : null)
        .toList();
    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'cv'
            ? cv = element.aboutValue.toString()
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'cv'
            ? cv = element.aboutValue.toString()
            : null)
        .toList();

    config.defaultApi.aboutOptions
        .map((element) => element.aboutName == 'info-img'
            ? info_img =
                'https://brktrk.com/img/' + element.aboutValue.toString()
            : null)
        .toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(children: [
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
                  ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image(
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                          image: CachedNetworkImageProvider(info_img))),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content_subtitle,
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontSize: 18),
                          ),
                          SizedBox(height: 16),
                          Text(
                            content_title,
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22),
                          ),
                          SizedBox(height: 16),
                          Text(
                            content_description,
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                color: secondColor,
                                fontSize: 14),
                          ),
                          SizedBox(height: 20),
                          Divider(
                            color: secondColor,
                            thickness: 0.3,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Name:",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                              SizedBox(width: 20),
                              Text(
                                name,
                                style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: secondColor,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Email:",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                              SizedBox(width: 20),
                              Text(
                                mail,
                                style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: primaryColor,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Age:",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '   ' + age.toString(),
                                style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: secondColor,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "From:",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                              SizedBox(width: 20),
                              Text(
                                ' ' + from,
                                style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: secondColor,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            child: Text("Download CV"),
                            onPressed: () => _launchURL(cv),
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                                width: 60,
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Divider(
                                      color: secondColor,
                                      thickness: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 30,
                              child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: config.defaultApi.socialMedia.length,
                                    itemBuilder: (BuildContext context, int index) =>
                                        IconButton(
                                            icon: index == 0
                                                ? Icon(
                                              Ionicons.logo_twitter,
                                              color: Colors.white,
                                            )
                                                : index == 1
                                                ? Icon(
                                              Ionicons.logo_linkedin,
                                              color: Colors.white,
                                            )
                                                : index == 2
                                                ? Icon(
                                              Ionicons.logo_github,
                                              color: Colors.white,
                                            )
                                                : Icon(
                                              Ionicons.logo_instagram,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              _launchURL(config
                                                  .defaultApi.socialMedia[index].url);
                                            })),
                              ),
                            ],
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
                              itemCount: config.defaultApi.services.length,
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
                                        MediaQuery.of(context).size.width * 0.40,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                  padding: EdgeInsets.only(left: 30),
                                                  icon: index == 0
                                                      ? Icon(
                                                    Ionicons.md_phone_portrait,
                                                    color: primaryColor,
                                                    size: 60,
                                                  )
                                                      : index == 1
                                                      ? Icon(
                                                    Ionicons.ios_photos,
                                                    color: primaryColor,
                                                    size: 60,
                                                  )
                                                      : index == 2
                                                      ? Icon(
                                                    Ionicons
                                                        .md_document,
                                                    color: primaryColor,
                                                    size: 60,
                                                  )
                                                      : Icon(
                                                    Ionicons.md_desktop,
                                                    color: primaryColor,
                                                    size: 60,
                                                  ),
                                                  onPressed: () {}),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 30, left: 30),
                                                child: Text(
                                                  config.defaultApi.services[index]
                                                      .serviceName,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins-Regular',
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              },
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
        )

      ],),
    );
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
