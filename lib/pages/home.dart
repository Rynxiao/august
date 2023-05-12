import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/components/calendar/date_events.dart';

import '../components/custom_scaffold.dart';
import '../components/calendar/lunar_detail.dart';
import '../components/calendar/month_header.dart';
import '../states/global_state.dart';
import '../components/calendar/calendar_grid.dart';
import '../components/calendar/week_header.dart';
import '../routes/routes.dart';
import '../states/home_state.dart';
import '../utils/date_utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;

    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            MonthHeader(
              onNavigateToMonth: () {
                showDateTimePicker(context, isDarkMode, (picked) {
                  homeState.select(picked.year, picked.month, picked.day);
                }, pickerMode: DateTimePickerMode.date);
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
      ),
      bottomNavigationBar: renderBottomNavigationBar(context, 0),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        onPressed: () {
          navigateTo(
            context,
            '/eventCreate/${homeState.selectedYear}/${homeState.selectedMonth}/${homeState.selectedDay}',
            transitionType: TransitionType.inFromRight,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
