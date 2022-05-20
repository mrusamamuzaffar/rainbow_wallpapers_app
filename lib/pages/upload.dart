// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:rainbow/constants/constraints.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class upload extends StatelessWidget {
  const upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Please sign-in to view the favorite walls you saved before",
              style: TextStyle(color: Colors.white),
            ),
          ),
          OutlinedButton.icon(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.red),
                ),
              ),
              onPressed: () {

                 AwesomeDialog(
                  context: context,
                  //customHeader: Image.asset("assets/icon/icon.png"),
                  dialogType: DialogType.ERROR,  
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'This feature is still in developement',
                    dialogBackgroundColor: Colors.white,

                  desc:
                      'Comeback Later',
                  btnOkOnPress: () {},
                  btnOkColor: backgroundColor,
                  
                )..show();
              },
              icon: Icon(
                Icons.login,
                color: Colors.red,
              ),
              label: Text(
                'SIGN-IN',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }
}
