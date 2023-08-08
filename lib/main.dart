import 'package:flutter/material.dart';

import 'home/my_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCalendar(),
    );
  }
}





