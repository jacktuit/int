import 'package:flutter/material.dart';
import 'package:task/home/weed_day_name.dart';

import 'calendar_day.dart';
class MyCalendar extends StatefulWidget {
  @override
  _MyCalendarState createState() => _MyCalendarState();
}
class _MyCalendarState extends State<MyCalendar> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Calendar'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
              height: 60,
              child: WeekDay(
                currentDate: currentDate,
              )),
          Expanded(
            child: CalendarGrid(currentDate: currentDate),
          ),
        ],
      ),
    );
  }
}

