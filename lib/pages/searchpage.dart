// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements


import 'package:flutter/material.dart';
import 'package:rainbow/cmponents/internet_check_onClick.dart';
import 'package:rainbow/constants/constraints.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:rainbow/pages/search_result.dart';

final TextEditingController _controller = TextEditingController();

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    Widget chip(String label_name, Color color) {
      return InputChip(
        onPressed: () {
          _controller.text = label_name;
        },
        label: Text(
          label_name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
        side: BorderSide(color: Colors.white),
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(6.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(label_name[0].toUpperCase()),
        ),
      );
    }

    wrapWidget() {
      return Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: <Widget>[
          chip('Ocean', Colors.black),
          chip('Tigers', Colors.black),
          chip('Pears', Colors.black),
          chip('Sports', Colors.black),
          chip('Nature', Colors.black),
          chip('Amoled', Colors.black),
        ],
      );
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // Replace this container with your Map widget
            LowerBody(),

            Positioned(
              top: 10,
              right: 15,
              left: 15,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                        controller: _controller,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusColor: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: InkWell(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onTap: () async {
                          if (_controller.text.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchResult(val: _controller.text),
                              ),
                            );
                          } else if (await getInternetUsingInternetConnectivity() ==
                              false) {
                            AwesomeDialog(
                              context: context,
                              //customHeader: Image.asset("assets/icon/icon.png"),
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: 'Offline',

                              desc: 'Please Connect to Internet Service ',
                              btnOkOnPress: () {},
                              btnOkColor: backgroundColor,
                              btnOkText: "Close",
                            )..show();
                          } else if (_controller.text.isEmpty) {
                            AwesomeDialog(
                              context: context,
                              //customHeader: Image.asset("assets/icon/icon.png"),
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: 'No Search Value',
                              btnOkColor: backgroundColor,
                              desc: 'Enter some search queries',
                              btnOkOnPress: () {},
                            )..show();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 15,
              right: 15,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: wrapWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LowerBody extends StatelessWidget {
  const LowerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 180,
                ),
              ),
              Image.asset(
                "assets/images/cycle1.png",
                fit: BoxFit.cover,
                width: 400,
                height: 400,
              ),
              Text(
                'Start by typing something in the search box',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
