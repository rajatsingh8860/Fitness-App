import 'package:flutter/material.dart';
import 'package:fitness/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var kBackgroundColor= Color(0xFFF8F8F8);
  var kActiveIconColor= Color(0xFFE68342);
  var kTextColor= Color(0xFF222B45);
  var kBlueLightColor= Color(0xFFC7B8F5);
  var kBlueColor= Color(0xFF817DC0);
  var kShadowColor= Color(0xFFE6E6E6);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
