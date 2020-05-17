import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:gapless_audio_loop/gapless_audio_loop.dart';

class DetailPage extends StatefulWidget {
  int TotalTime, time1, time2, time3, time4;

  double mean;
  DetailPage(this.TotalTime, this.mean, this.time1, this.time2, this.time3,
      this.time4);
  @override
  State<StatefulWidget> createState() {
    return DetailPageState(this.TotalTime, this.mean, this.time1, this.time2,
        this.time3, this.time4);
  }
}

class DetailPageState extends State<DetailPage> {


  DetailPageState(this.TotalTime, this.mean, this.time1, this.time2, this.time3,
      this.time4);

  int TotalTime, time1, time2, time3, time4;

  VideoPlayerController controller;
  var timeToStopWatch = "00:00:00";
  bool startispressed = true;
  var player = GaplessAudioLoop();
  double mean;
  bool started = true;
  double progress = 0.0;

  //these variables is of audio

  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);

  @override
  void initState(){
    super.initState();
    controller=VideoPlayerController.asset('assets/new/newVideo.mp4')
    ..initialize().then((_){
      setState(() {});
    });
    controller.play();
    controller.setLooping(true);
  }
  void startTimer() {
    Timer(dur, keepRunning);
  }

  void keepRunning() {
    player.loadAsset('c.mp3');
    player.play();
    if (swatch.isRunning) {
      startTimer();
      setState(() {
        if (progress < 1) {
          progress = progress + mean;
        }
      });
      if (swatch.elapsed.inSeconds == time2) {
        player.pause();
        swatch.stop();
        Future.delayed(const Duration(seconds: 40), () {
          startStopWatch();
          player.resume();
        });
      }
      if (swatch.elapsed.inSeconds == time3 + time2) {
        player.pause();
        swatch.stop();
        Future.delayed(const Duration(seconds: 40), () {
          startStopWatch();
          player.resume();
        });
      }
      if (swatch.elapsed.inSeconds == time2 + time3 + time4) {
        player.pause();
        swatch.stop();
        Future.delayed(const Duration(seconds: 40), () {
          startStopWatch();
          player.resume();
        });
      }
      if (swatch.elapsed.inSeconds == TotalTime) {
        swatch.reset();
        startispressed = true;
        player.pause(); //this is used to stop audio
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>
                DetailPage(TotalTime, mean, time1, time2, time3, time4)));
      }
    }
    setState(() {
      timeToStopWatch = swatch.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  void startStopWatch() {
    setState(() {
      startispressed = false;
      swatch.start();
      startTimer();
    });
  }

  void pauseWatch() {
    swatch.stop();
    startispressed = true;
  }

  Future<bool> onBackPressed() {
    Navigator.pop(context);
     player.pause();
  }

  Widget stopWatch() {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 6,
              child: CircularPercentIndicator(
                radius: 250,
                circularStrokeCap: CircularStrokeCap.round,
                percent: progress,
                lineWidth: 20,
                center: new Text(
                  timeToStopWatch.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              )),
          Expanded(
              flex: 3,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //  Expanded(
                  RaisedButton(
                    color: Colors.green,
                    onPressed: startispressed ? startStopWatch : null,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 10.0,
                    ),
                    child: new Text(
                      "Start Exercise",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child:Scaffold(
        body:Stack(
          fit:StackFit.expand,
          children: <Widget>[
        Container(
        child: controller.value.initialized
        ? AspectRatio(
        aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ) : Container()
        ),
            stopWatch()
          ],
        )
      )
    );

  }
}
