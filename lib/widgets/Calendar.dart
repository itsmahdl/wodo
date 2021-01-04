import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Calendar extends StatelessWidget {
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 30,0,10),
      child: Text(DateFormat.MMMMEEEEd().format(now), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}
