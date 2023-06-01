import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/widgets/calendar/date_events.dart';

import '../widgets/calendar/lunar_detail.dart';
import '../widgets/calendar/month_header.dart';
import '../states/global_state.dart';
import '../widgets/calendar/calendar_grid.dart';
import '../widgets/calendar/week_header.dart';
import '../states/calendar_state.dart';
import '../utils/date_utils.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<CalendarState>(context);
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;

    return SafeArea(
      child: Column(
        children: [
          MonthHeader(
            onNavigateToMonth: () {
              showDateTimePicker(
                context,
                isDarkMode,
                    (picked) {
                  homeState.select(picked.year, picked.month, picked.day);
                },
                dateFormat: 'yyyy年-M月-d日',
              );
            },
          ),
          const WeekHeader(),
          const CalendarGrid(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  DateEvents(),
                  LunarDetail(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
