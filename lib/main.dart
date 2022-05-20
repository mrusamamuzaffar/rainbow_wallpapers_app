// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rainbow/constants/constraints.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/model/variables.dart';
import 'package:rainbow/pages/search_result.dart';
import 'cmponents/persistent_nav_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

Map result = {};

Map result_final = {};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var streams;
  String status = "Offline";
  int navIndex = 0;

  fetchApi() async {
    await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=amoled wallpaper black dark&per_page=80'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001aaeacbabef4c4c6085b4432c1b2a287f'
        }).then((value) {
      result = jsonDecode(value.body);
      //print(result);
      setState(() {
        images = result['photos'];
      });
      //print(images[0]);
    });
  }

  fetchApis() async {
    await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=amoled wallpaper black dark&per_page=80'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001aaeacbabef4c4c6085b4432c1b2a287f'
        }).then((value) {
      output = jsonDecode(value.body);
      //print(result);
      setState(() {
        list1 = output['photos'];
      });
      //print(images[0]);
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
    streams =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      if (event == ConnectivityResult.none) {
       AwesomeDialog(
                  context: context,
                  //customHeader: Image.asset("assets/icon/icon.png"),
                  dialogType: DialogType.ERROR,  
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Offline',
                    dialogBackgroundColor: Colors.white,

                  desc:
                      'Connect to Internet Service ',
                  btnOkOnPress: () {},
                  btnOkColor: backgroundColor,
                  
                )..show();
      } else {
       
        status = "Online";
        print(status);
      }
    });
    fetchApi();
    fetchApis();
  }

  @override
  void dispose() {
    super.dispose();
    streams.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables

        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'RainBow',
          style: TextStyle(color: Colors.white,fontFamily: 'Corinthia',fontSize: 25),
        ),
        leading: InkWell(
          onTap: (){
            print("Notification Clicked");
            AwesomeDialog(
          context: context,
          //customHeader: Image.asset("assets/icon/icon.png"),
          dialogType: DialogType.INFO,
          animType: AnimType.BOTTOMSLIDE,
          title: 'No Notifications Available',
          dialogBackgroundColor: Colors.white,

          btnOkOnPress: () {},
          btnOkColor: backgroundColor,
        ).show();
          },
          
          child: Icon(Icons.notifications_outlined)),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          PopupMenuButton<int>(
            color: Colors.black,
            onSelected: (item){
              if(item==0)
              {
                    SystemNavigator.pop();

              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Exit')),
              
            ],
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      // ignore: prefer_const_literals_to_create_immutables
      body: persistent_navbar(),
      // ignore: prefer_const_literals_to_create_immutables
    );
  }
}
