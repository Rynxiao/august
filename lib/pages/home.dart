import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/components/month_header.dart';
import 'package:simple_calendar/states/global_state.dart';

import '../components/calendar_grid.dart';
import '../components/week_header.dart';
import '../routes/routes.dart';
import '../states/home_state.dart';

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

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          MonthHeader(
            onNavigateToMonth: () {
              _selectDate(context, homeState, globalState);
            },
          ),
          const WeekHeader(),
          const CalendarGrid(),
        ],
      ),
      bottomNavigationBar: renderBottomNavigationBar(context, 0),
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    HomeState homeState,
    GlobalState globalState,
  ) async {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(2101),
      cancelText: localizations.cancelButtonLabel,
      confirmText: localizations.okButtonLabel,
      locale: Localizations.localeOf(context),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: globalState.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: child ?? Container(),
        );
      },
    );
    if (picked != null) {
      homeState.select(picked.year, picked.month, picked.day);
    }
  }
}
