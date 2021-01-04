import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tomorrows extends StatelessWidget {
  var time;
  var title;
  Tomorrows(this.title, this.time);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
      child: Container(
        height: 200,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(title,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  time,
                  style: TextStyle(
                      color: Color(0xffb4b4b4), fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('assets/images/Tomorrow_Background.png'))),
          width: 150,
        ),
      ),
    );
  }
}
