import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:marquee/marquee.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Todays extends StatelessWidget {
  final String name;
  final String date;
  Todays(this.name, this.date);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
      child: Container(
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(255, 178, 102, 0.5)),
                  child: Icon(
                    FontAwesome.tasks,
                    color: Colors.deepOrange,
                  ),
                  height: 70,
                  width: 70,
                ),
              ),
              Container(
                width: 150,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        minFontSize: 25,
                        overflowReplacement: Container(
                            width: double.maxFinite,
                            height: 50,
                            child: Marquee(
                              showFadingOnlyWhenScrolling: true,
                              velocity: 40,
                              blankSpace: 50,
                              pauseAfterRound: Duration(seconds: 1),
                              accelerationCurve: Curves.decelerate,
                              accelerationDuration: Duration(milliseconds: 500),
                              decelerationCurve: Curves.decelerate,
                              decelerationDuration: Duration(milliseconds: 500),
                              fadingEdgeStartFraction: 0.1,
                              fadingEdgeEndFraction: 0.1,
                              text: name,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Text(date != null ? date : ''),
                    ],
                  ),
                ),
            ],
          ),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white)),
    );
  }
}
