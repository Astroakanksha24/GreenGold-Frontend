import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' as math;
import 'survey.dart';
import 'package:green_building/admin/survey.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double percent = 0.0;
  @override
  // void initState() {
  //   // late Timer timer;
  //   // timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
  //   print('Percent Update');
  //   setState(() {
  //     percent = getCurrentScore().toDouble();
  //     if (percent >= 100) {
  //       // timer.cancel();
  //       percent = 100;
  //       // percent=0;
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 350,
      child: LinearPercentIndicator(
        width: 230.0,
        // animation: true,
        // animationDuration: 1000,
        lineHeight: 30.0,
        percent: getCurrentScore().toDouble() / 100,
        trailing: Text(
          getCurrentScore().toString() + '%',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        linearStrokeCap: LinearStrokeCap.butt,
        progressColor: Color(
          (0xFF13552C),
        ),
        backgroundColor: Colors.white,
      ),
      // LinearPercentIndicator(
      //   //leaner progress bar
      //   animation: true,
      //   animationDuration: 1000,
      //   lineHeight: 20.0,
      //   percent: percent / 100,
      //   center: Text(
      //     getCurrentScore().toString(),
      //     //percent.toString() + "%",
      //     style: TextStyle(
      //         fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.black),
      //   ),
      //   linearStrokeCap: LinearStrokeCap.roundAll,
      //   progressColor: Color(0xFF13552C),
      //   backgroundColor: Colors.grey[300],
      // ),
    );
  }
}
