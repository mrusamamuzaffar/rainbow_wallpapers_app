import 'package:flutter/material.dart';
import 'package:rainbow/constants/constraints.dart';
import 'package:rainbow/pages/StaggedGridView.dart';
import 'package:rainbow/pages/categories.dart';
import 'package:rainbow/pages/signin.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor,
         body: Column(
           children: [
             TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
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
          ),

          Expanded(child: TabBarView(children: [
          StagedGridView(),
          SignIn(),
            categories(),
        ]),)
           ],
         

           
         ),
       
      ),
      
    );
  }
}