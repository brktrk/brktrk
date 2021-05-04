import 'package:brktrk/config.dart';
import 'package:brktrk/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Contact extends StatelessWidget {
  // ignore: non_constant_identifier_names
  var description, content_title, title, ci_content_title, info_description,name,location,call,mail,submit;
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<Config>(context, listen: true);
    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'name'
        ? name = element.contactValue.toString()
        : null)
        .toList();
    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'location'
        ? location = element.contactValue.toString()
        : null)
        .toList();
    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'call'
        ? call = element.contactValue.toString()
        : null)
        .toList();
    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'mail'
        ? mail = element.contactValue.toString()
        : null)
        .toList();
    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'submit'
        ? submit = element.contactValue.toString()
        : null)
        .toList();
    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'description'
            ? description = element.contactValue.toString()
            : null)
        .toList();

    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'title'
            ? title = element.contactValue.toString()
            : null)
        .toList();

    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'content_title'
            ? content_title = element.contactValue.toString()
            : null)
        .toList();
    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'ci_content_title'
            ? ci_content_title = element.contactValue.toString()
            : null)
        .toList();
    config.defaultApi.contactOptions
        .map((element) => element.contactName == 'info_description'
            ? info_description = element.contactValue.toString()
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
              child: Column(children: [
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
                            content_title,
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 26),
                          ),
                          Form(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30),
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  color: itemColor,
                                  child: TextField(
                                    controller: nameController,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        color: secondColor,
                                      ),
                                      hintText: 'Username',
                                    ),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins-Regular'),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  color: itemColor,
                                  child: TextField(
                                    controller: mailController,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        color: secondColor,
                                      ),
                                      hintText: 'Email',
                                    ),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins-Regular'),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  color: itemColor,
                                  child: TextField(
                                    controller: subjectController,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        color: secondColor,
                                      ),
                                      hintText: 'Subject',
                                    ),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins-Regular'),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  color: itemColor,
                                  child: TextField(
                                    controller: messageController,
                                    keyboardType: TextInputType.multiline,
                                    minLines: 5,
                                    maxLines: 10,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        color: secondColor,
                                      ),
                                      hintText: 'Message',
                                    ),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins-Regular'),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      child: Text(submit),
                                      onPressed: () => {
                                        send(context)
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: primaryColor,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 40),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ci_content_title,
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Bold',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 24),
                                    ),
                                    Text(
                                      info_description,
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          color: secondColor,
                                          fontSize: 14),
                                    ),
                                    SizedBox(height: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Ionicons.ios_happy,
                                              color: primaryColor,
                                              size: 50,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  width: 2,
                                                  height: 60,
                                                  color: secondColor,
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        name,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Regular',
                                                            color: secondColor,
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Ionicons.md_map,
                                              color: primaryColor,
                                              size: 50,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  width: 2,
                                                  height: 60,
                                                  color: secondColor,
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'location',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        location,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Regular',
                                                            color: secondColor,
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Ionicons.md_call,
                                              color: primaryColor,
                                              size: 50,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  width: 2,
                                                  height: 60,
                                                  color: secondColor,
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Call Me',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        call,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Regular',
                                                            color: secondColor,
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Ionicons.md_send,
                                              color: primaryColor,
                                              size: 50,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  width: 2,
                                                  height: 60,
                                                  color: secondColor,
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 12),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Email me',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        mail,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-Regular',
                                                            color: secondColor,
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
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
  Future<void> send(context) async {
    final Email email = Email(
      body: messageController.text + '\t Mail: ' + mailController.text,
      subject: subjectController.text + ' ' + nameController.text,
      recipients: ['me@brktrk.com'],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
}
