import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wodo/database_helper.dart';
import 'package:wodo/widgets/todays.dart';

class ThreeafterTomorrow extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<ThreeafterTomorrow> {
  DatabaseHelper dbHelper = DatabaseHelper();
  var format = DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 4)));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffffe5d5),
          body: ListView(
            children: [
              Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: Text(
                        format,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                    ),
                    FutureBuilder(
                      initialData: [],
                      future: dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            // ignore: missing_return
                            itemBuilder: (context, index) {
                              final tomorrow = DateTime.now().add(Duration(days: 4));
                              final time = DateTime.parse(snapshot.data[index].date);
                              var databaseFormated =
                              DateFormat.MMMd().add_Hm().format(time);
                              if (tomorrow.year == time.year &&
                                  tomorrow.month == time.month &&
                                  tomorrow.day == time.day) {
                                return Todays(
                                    snapshot.data[index].name != null
                                        ? snapshot.data[index].name
                                        : '',
                                    databaseFormated);
                              } else {
                                return SizedBox.shrink();
                              }
                            });
                      },
                    ),
                  ])
            ],
          ),
        ));
  }
}
