import 'package:flutter/material.dart';
class WeekDay extends StatelessWidget {
  final DateTime currentDate;

  WeekDay({required this.currentDate});

  @override
  Widget build(BuildContext context) {
    final List<String> weekdays = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun'
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (context, index) {
        if (index < 7) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(),
            child: Text(
              weekdays[index],
              style: TextStyle(
                  color:
                  weekdays[index] == 'Sun' ? Colors.red : Colors.black54),
            ),
          );
        }
      },
    );
  }
}
