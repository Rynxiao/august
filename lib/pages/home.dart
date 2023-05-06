import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/components/month_header.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          MonthHeader(
            onNavigateToMonth: () {
              _selectDate(context, homeState);
            },
          ),
          const WeekHeader(),
          const CalendarGrid(),
        ],
      ),
      bottomNavigationBar: renderBottomNavigationBar(context, 0),
    );
  }

  Future<void> _selectDate(BuildContext context, HomeState homeState) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      homeState.select(picked.year, picked.month, picked.day);
    }
  }
}
