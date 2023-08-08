import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/color_model.dart';
import '../model/day_model.dart';

class CalendarGrid extends StatefulWidget {
  final DateTime currentDate;

  CalendarGrid({required this.currentDate});

  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {
  Dio _dio = Dio();
  String _response = '';
  DaysModel? dayCount;
  ColorModel? colorModelInfo;

  List<int> backendNumbers = [];
  List<int> backendColors = [];

  @override
  void initState() {


    fetchDay();
    fetchColor();
    super.initState();
  }

  int? indexOfColor;

  void fetchDay() async {
    try {
      Response response = await _dio.get('https://www.jsonkeeper.com/b/ADYD');
      setState(() {
        dayCount = DaysModel.fromJson(response.data);
        for (var i = 0; i < (dayCount!.days?.length ?? 0); i++) {
          backendNumbers.add(dayCount?.days![i].day ?? 0);
          indexOfColor = i;
          backendColors.add(dayCount?.days![i].type ?? 0);
        }
      });
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    }
  }
  final List<ColorModel> test = [];

  void fetchColor() async {
    try {
      final response = await _dio.get('https://www.jsonkeeper.com/b/N5M6');
      final resultClass = response.data;
      print("-----");
      for (int i = 0; i < resultClass.length; i++) {
        final color = ColorModel.fromJson(resultClass[i]);
        test.add(color);
        print(test.length);

      }
      print(test[0].type);

    } catch (e) {

    }

  }




  @override
  Widget build(BuildContext context) {
    final DateTime firstDayOfMonth =
        DateTime(widget.currentDate.year, widget.currentDate.month, 1);
    final int daysInMonth =
        DateTime(widget.currentDate.year, widget.currentDate.month + 1, 0).day;
    final int startingWeekday =
        firstDayOfMonth.weekday - 1; // Adjust to start from Monday
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: daysInMonth + startingWeekday,
      itemBuilder: (context, index) {
        if (index < startingWeekday) {
          return Container(); // Empty container for days before the first day of the month
        }
        final int day = index - startingWeekday + 1;
        final bool hasBackendNumber = backendNumbers.contains(day);

        return Container(
          margin: EdgeInsets.all(4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: hasBackendNumber == true
                  ? Colors.grey
                  // : (dayCount?.days![index].type == 200)
                  //     ? Colors.green
                  //     : (dayCount?.days![index].type == 100)
                  //         ? Colors.blue
                  //         : (dayCount?.days![index].type == 300)
                  //             ? Colors.orange
                  : Colors.red,
              shape: BoxShape.circle),
          child: Text('$day'),
        );
      },
    );

    // Column(children: List.generate((day!.days?.length??0), (index) => Text((day?.days![index].day).toString())),);
  }
}
