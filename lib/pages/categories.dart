// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rainbow/pages/search_result.dart';

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                print("Nature is clicked");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchResult(val: 'nature'),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.white, width: 3)),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage("assets/images/nature.jpg"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Nature",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Abstract is clicked");
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchResult(val: 'abstract wallpaper')));
              },
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.white, width: 3)),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage("assets/images/abstract.jpg"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Abstract",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Amoled is clicked");
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchResult(val: 'amoled wallpaper black dark')));
              },
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.white, width: 3),
                ),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/images/amoled.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Amoled",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 40,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Nature is clicked");
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchResult(val: 'fluid art')));

              },
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.white, width: 3),
                ),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/images/fluid.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Fluid",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Motivation is clicked");
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchResult(val: 'motivational')));

              },
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.white, width: 3)),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage("assets/images/motivation.jpg"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Motivational",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 40,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchResult(val: 'islamic')));

               // print(" is clicked");
              },
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.white, width: 3),
                ),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage("assets/images/Quaran.jpg"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Muslim",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 40,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("hindu is clicked");
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchResult(val: 'hindu')));

              },
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.white, width: 3)),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage("assets/images/hindu.jpg"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Hinduism",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 40,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
