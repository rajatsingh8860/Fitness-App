import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitness/detail.dart';

var kBackgroundColor= Color(0xFFF8F8F8);
var kActiveIconColor= Color(0xFFE68342);
var kTextColor= Color(0xFF222B45);
var kBlueLightColor= Color(0xFFC7B8F5);
var kBlueColor= Color(0xFF817DC0);
var kShadowColor= Color(0xFFE6E6E6);

class ListPage extends StatefulWidget{
  String url1,url2,url3,url4,name1,name2,name3,name4,url5;
  int time1,time2,time3,time4;
  ListPage(this.url1,this.url2,this.url3,this.url4,this.url5,this.name1,this.name2,this.name3,this.name4,this.time1,this.time2,this.time3,this.time4);
  @override
  State<StatefulWidget> createState() {
    return ListPageState(this.url1,this.url2,this.url3,this.url4,this.url5,this.name1,this.name2,this.name3,this.name4,this.time1,this.time2,this.time3,this.time4);
  }
}

class ListPageState extends State<ListPage>{
  String url1,url2,url3,url4,name1,name2,name3,name4,url5;
  int time1,time2,time3,time4;
  ListPageState(this.url1,this.url2,this.url3,this.url4,this.url5,this.name1,this.name2,this.name3,this.name4,this.time1,this.time2,this.time3,this.time4);
  @override
  Widget build(BuildContext context) {
    var TotalTime=time1+time2+time3+time4;
    var mean=(1/(TotalTime*60));
    var size=MediaQuery.of(context).size;

    return Scaffold(
        body:Stack(
          children: <Widget>[
            new Container(
              height:size.height * 0.40,
              decoration: BoxDecoration(
                 // color: kBlueColor,
                  image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage(url5)
                  )
              ),
            ),
            new SafeArea(
                child:Padding(
                  padding:EdgeInsets.only(left:10.0,right:10.0,top:50.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     /* Text("Good Morning",
                          textAlign: TextAlign.left,
                          style:Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(fontWeight: FontWeight.w500)
                      )*/
                      SizedBox(height:size.height*0.25),
                      new Expanded(
                         // child:GestureDetector(
                            //    onTap: Navigator.push(context,MaterialPageRoute(builder: context)=>DetailPage()),
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 0.70,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              children: <Widget>[
                                CategoryCard(title: name1,
                                    svgSrc:url1,time:time1),
                                CategoryCard(title: name2,
                                    svgSrc:url2,time:time2),
                                CategoryCard(title: name3,
                                    svgSrc:url3,time:time3),
                                CategoryCard(title: name4,
                                    svgSrc:url4,time:time4),

                              ],
                            ),
                          //)
                      ),
                    //  GestureDetector(
                      //  onTap: (){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(TotalTime*60,mean,time1,time2,time3,time4)));
                        //},
                         Padding(
                          padding:EdgeInsets.only(left:size.width*0.2,bottom:size.width*0.05),
                          child: RaisedButton(
                            color:Colors.green,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(TotalTime*60,mean,time1*60,time2*60,time3*60,time4*60)));
                            },
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 10.0,
                            ),
                            child: new Text("Start Exercise",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color:Colors.white
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                          ),
                        ),
                    //  ),
                    ],
                  ),
                )
            )
          ],
        )
    );
  }

}

class CategoryCard extends StatelessWidget{

  final String svgSrc;
  final String title;
  final int time;
  const CategoryCard(
      {
        Key key,
        this.svgSrc,
        this.title,
        this.time
      }): super(key:key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
      return ClipRRect(
        borderRadius: BorderRadius.circular(13.0),
        child: Container(
            padding:EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color:Colors.white,

                boxShadow: [
                  BoxShadow(
                      offset:Offset(0,17),
                      blurRadius: 17,
                      spreadRadius: -23,
                      color:kShadowColor
                  )
                ]
            ),
            child:Material(
              color:Colors.transparent,
              child: new Column(
                children: <Widget>[
                  Spacer(),
                  Image(image:AssetImage(svgSrc)),
                  Spacer(),
                  Text(
                      title,
                      textAlign:TextAlign.center,
                      style:Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 15)
                  ),
                  Text(
                    "${time.toString()} min",
                    textAlign:TextAlign.center,
                    style:TextStyle(fontSize:15),
                  ),

                ],
              ),
              //    ),
            ),

        ),
      );
  }

}