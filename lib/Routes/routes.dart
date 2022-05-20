import 'package:flutter/material.dart';
import 'package:rainbow/pages/categories.dart';
String category_result="";

class Routes extends StatelessWidget {
  const Routes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      routes: {
        '/categoris': (context) => categories(),
        
      },
      
      
    );
  }
}