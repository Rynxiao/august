import 'package:flutter/material.dart';
import 'package:simple_calendar/core/calendar.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/components/month_header.dart';

import '../components/calendar_grid.dart';
import '../components/week_header.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.title});

  final String title;
  final Calendar calendar = Calendar();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var calendar = widget.calendar;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          MonthHeader(
            year: calendar.currentYear,
            month: calendar.currentMonth,
            onNavigateToMonth: () {
              // TODO: Implement month navigation
            },
          ),
          WeekHeader(calendar: calendar),
          CalendarGrid(calendar: calendar),
        ],
      ),
    );
  }
}
