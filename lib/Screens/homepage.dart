import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:wodo/Screens/1dayafterTomorrow.dart';
import 'package:wodo/Screens/2dayafterTomorrow.dart';
import 'package:wodo/Screens/3dayafterTomorrow.dart';
import 'package:wodo/Screens/4dayafterTomorrow.dart';
import 'package:wodo/Screens/5dayafterTomorrow.dart';
import 'package:wodo/Screens/Add_Item.dart';
import 'package:wodo/Screens/Tomorrow.dart';
import 'package:wodo/Screens/Today.dart';
import 'package:wodo/database_helper.dart';
import 'package:wodo/widgets/Calendar.dart';
import 'package:intl/intl.dart';
import 'package:wodo/widgets/todays.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Today.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future permission() async {
    await Permission.storage.request();
  }

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    permission();
    Future.delayed(Duration.zero, () {
      setState(() {});
    });
  }

  final pages = [HomePageClass(), Today(), Tomorrow()];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffe5d5),
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        // ignore: unnecessary_statements
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff405096),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end,
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: [
          BubbleBottomBarItem(
              backgroundColor: Color(0xff405096),
              icon: Icon(Icons.dashboard_rounded, color: Color(0xffbebebe)),
              activeIcon:
                  Icon(Icons.dashboard_rounded, color: Color(0xff405096)),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Color(0xff405096),
              icon: Icon(Typicons.calendar_outlilne, color: Color(0xffbebebe)),
              activeIcon:
                  Icon(Typicons.calendar_outlilne, color: Color(0xff405096)),
              title: Text("Today")),
          BubbleBottomBarItem(
              backgroundColor: Color(0xff405096),
              icon: Icon(Typicons.calendar, color: Color(0xffbebebe)),
              activeIcon: Icon(Typicons.calendar, color: Color(0xff405096)),
              title: Text("Tomorrow"))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class HomePageClass extends StatelessWidget {
  int currentIndex = 0;

  DatabaseHelper dbHelper = DatabaseHelper();
  var underCalendar =
      List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Calendar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 27,
                              );
                            },
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var day = underCalendar[index];
                              return Container(
                                child: Center(
                                    child: Text(
                                  DateFormat.E().format(day),
                                  style: TextStyle(color: Colors.white),
                                )),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: underCalendar.length,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 18,
                              );
                            },
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var day = underCalendar[index];
                              return GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Today();
                                    }));
                                  } else if (index == 1) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Scaffold(
                                        body: Tomorrow(),
                                      );
                                    }));
                                  } else if (index == 2) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Scaffold(
                                        body: OneafterTomorrow(),
                                      );
                                    }));
                                  } else if (index == 3) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Scaffold(
                                        body: TwoafterTomorrow(),
                                      );
                                    }));
                                  } else if (index == 4) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return Scaffold(body: ThreeafterTomorrow(),);
                                    }));
                                  } else if (index == 5) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return Scaffold(body: FourafterTomorrow(),);
                                    }));
                                  } else if (index == 6) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return Scaffold(body: FiveafterTomorrow(),);
                                    }));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      DateFormat.d().format(day),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: underCalendar.length,
                          ),
                        ),
                      ],
                    ),
                  ]),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/Container_BackGround.png'),
                      fit: BoxFit.fitWidth),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                  child: Text(
                    'Overview',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              initialData: [],
              future: dbHelper.getTasks(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      DateTime time = DateTime.parse(snapshot.data[index].date);
                      var formated = DateFormat.MMMd().add_Hm().format(time);
                      return Dismissible(
                        onDismissed: (direction) {
                          dbHelper.delete(snapshot.data[index].id);
                        },
                        key: ValueKey(Todays),
                        child: Todays(
                          snapshot.data[index].name != null
                              ? snapshot.data[index].name
                              : '',
                          formated.toString(),
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ],
    );
  }
}
