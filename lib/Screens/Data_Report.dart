import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DataReportPage extends StatefulWidget {
  @override
  _DataReportState createState() => _DataReportState();
}

class _DataReportState extends State<DataReportPage> {
  var currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffffe5d5),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Data Report',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('All Activities',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        Image(
                          image: AssetImage('assets/images/graph.png'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '52',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 27),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'activity',
                              style: TextStyle(color: Color(0xffcececf)),
                            )
                          ],
                        )
                      ],
                    ),
                    height: 175,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Completed',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        CircularPercentIndicator(
                          radius: 90,
                          animation: true,
                          progressColor: Colors.white,
                          percent: 0.75,
                          backgroundColor: Color(0xffdd677a),
                          center: Text(
                            '75%',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xffd43f56),
                        borderRadius: BorderRadius.circular(20)),
                    height: 175,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Missed',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          CircularPercentIndicator(
                            radius: 90,
                            animation: true,
                            progressColor: Colors.white,
                            percent: 0.25,
                            backgroundColor: Color(0xfffbb6d5),
                            center: Text(
                              '25%',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xfff884b9),
                          borderRadius: BorderRadius.circular(20)),
                      height: 175,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('On Time',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        Image(
                          image: AssetImage('assets/images/graph1.png'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '35',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 27),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'activity',
                              style: TextStyle(color: Color(0xffcececf)),
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 175,
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
