import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitness/list.dart';

var kBackgroundColor = Color(0xFFF8F8F8);
var kActiveIconColor = Color(0xFFE68342);
var kTextColor = Color(0xFF222B45);
var kBlueLightColor = Color(0xFFC7B8F5);
var kBlueColor = Color(0xFF817DC0);
var kShadowColor = Color(0xFFE6E6E6);

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          height: size.height * 0.40,
          decoration: BoxDecoration(
              color: kBlueColor,
              image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/new/secondLogo.png"))),
        ),
        new SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.19),
              new Expanded(
                child: GestureDetector(
                  //    onTap: Navigator.push(context,MaterialPageRoute(builder: context)=>DetailPage()),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.70,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListPage(
                                      "assets/new/4.png",
                                      "assets/new/1.png",
                                      "assets/new/2.png",
                                      "assets/new/3.png",
                                      "assets/new/eleven.jpeg",
                                      "Streching",
                                      "Push ups",
                                      "Squats",
                                      "Arm Strech",
                                      1,
                                      1,
                                      1,
                                      1)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 17),
                                        blurRadius: 17,
                                        spreadRadius: -23,
                                        color: kShadowColor)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: new Column(
                                  children: <Widget>[
                                    Spacer(),
                                    Image(
                                        image: AssetImage("assets/new/4.png")),
                                    Spacer(),
                                    Text("Full Body Exercises",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .title
                                            .copyWith(fontSize: 15))
                                  ],
                                ),
                                //    ),
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListPage(
                                      "assets/new/5.png",
                                      "assets/new/6.png",
                                      "assets/new/7.png",
                                      "assets/new/8.png",
                                      "assets/new/thirteen.jpeg",
                                      "Leg Streching",
                                      "Push ups",
                                      "Arm exercise",
                                      "Ball Push ups",
                                      10,
                                      20,
                                      20,
                                      20)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 17),
                                        blurRadius: 17,
                                        spreadRadius: -23,
                                        color: kShadowColor)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: new Column(
                                  children: <Widget>[
                                    Spacer(),
                                    SvgPicture.asset(
                                        "assets/icons/Excrecises.svg"),
                                    Spacer(),
                                    Text("Leg Exercises",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .title
                                            .copyWith(fontSize: 15))
                                  ],
                                ),
                                //    ),
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListPage(
                                      "assets/new/9.png",
                                      "assets/new/10.png",
                                      "assets/new/11.png",
                                      "assets/new/12.png",
                                      "assets/new/fourteen.jpeg",
                                      "Surya Namaskar",
                                      "Leg Exercise",
                                      "Arm Streching",
                                      "Dumbles",
                                      2,
                                      10,
                                      10,
                                      15)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 17),
                                        blurRadius: 17,
                                        spreadRadius: -23,
                                        color: kShadowColor)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: new Column(
                                  children: <Widget>[
                                    Spacer(),
                                    SvgPicture.asset(
                                        "assets/icons/Meditation.svg"),
                                    Spacer(),
                                    Text("Arm Exercises",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .title
                                            .copyWith(fontSize: 15))
                                  ],
                                ),
                                //    ),
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListPage(
                                      "assets/new/13.png",
                                      "assets/new/14.png",
                                      "assets/new/1.png",
                                      "assets/new/2.png",
                                      "assets/new/fifteen.jpeg",
                                      "Arm Streching",
                                      "Back Exercise",
                                      "Push ups",
                                      "Squats",
                                      10,
                                      15,
                                      20,
                                      15)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 17),
                                        blurRadius: 17,
                                        spreadRadius: -23,
                                        color: kShadowColor)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: new Column(
                                  children: <Widget>[
                                    Spacer(),
                                    Image(
                                        image: AssetImage("assets/new/5.png")),
                                    // SvgPicture.asset("assets/new/5.png"),
                                    Spacer(),
                                    Text("Upper Body Exercises",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .title
                                            .copyWith(fontSize: 15))
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    ));
  }
}
