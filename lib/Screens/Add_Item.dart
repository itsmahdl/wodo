import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wodo/Screens/homepage.dart';
import 'package:wodo/database_helper.dart';
import 'package:wodo/models/task.dart';
import 'package:rounded_flutter_datetime_picker/rounded_flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddPage> {
  var timeseter;
  var nameseter;

  setTime(date) async {
    setState(() {
      // ignore: unnecessary_statements
      date;
    });
    return date;
  }

  setName(text) async {
    setState(() {
      // ignore: unnecessary_statements
      text;
    });
    return text;
  }

  TextEditingController controller = TextEditingController();
  DatabaseHelper dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffe4d4),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Add_Page.png'),
                        fit: BoxFit.fitWidth)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                          child: Container(
                              child: Icon(Icons.keyboard_backspace_rounded)),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 20),
                      child: Text(
                        'Create\nNew Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            color: Color(0xffcbb6ac)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        onSubmitted: (text) async {
                          nameseter = setName(text);
                        },
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: 'Task Name',
                            hintStyle:
                                TextStyle(fontSize: 21, color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Expanded(
                                        child: Text(
                                          'Date and Time',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w100,
                                              color: Color(0xffcbb6ac)),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            'Tap to select time',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        DatePicker.showDateTimePicker(context,
                                            minTime: DateTime.now(),
                                            onConfirm: (date) async {
                                          timeseter = setTime(date);
                                        });
                                      },
                                    ),
                                    SizedBox(height: 40),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          var time = await timeseter;
                                          String formated =
                                              DateFormat('yyyy-MM-dd HH:mm:ss')
                                                  .format(time);
                                          var name = controller.text;
                                          if (name != null && time != null) {
                                            Task newTask = Task(
                                                name: name.toString(),
                                                date: formated);
                                            await dbHelper.insertTask(newTask);
                                          } else {
                                            Task newTask = Task(
                                                name: 'task name',
                                                date: 'task time');
                                            await dbHelper.insertTask(newTask);
                                          }
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()));
                                          setState(() {});
                                        },
                                        child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Color(0xff415196),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Center(
                                                child: Text(
                                              'Create Task',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ))),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ])),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                width: double.infinity,
                height: 255,
              ),
            ],
          ),
        ));
  }
}
