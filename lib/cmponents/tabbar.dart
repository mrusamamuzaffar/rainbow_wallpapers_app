// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({ Key? key }) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return tab(
      
      
    );
  }
}




 tab(){

  return TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,

            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              Tab(
                icon: Icon(
                  Icons.image_outlined,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.portrait_outlined,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.collections_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          );
}