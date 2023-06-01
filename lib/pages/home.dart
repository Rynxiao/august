import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/pages/calendar.dart';
import 'package:simple_calendar/pages/common_sense.dart';
import 'package:simple_calendar/pages/settings.dart';
import 'package:simple_calendar/pages/weather.dart';
import 'package:simple_calendar/states/calendar_state.dart';

import '../routes/routes.dart';
import '../widgets/custom_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    final homeState = Provider.of<CalendarState>(context);

    return Scaffold(
      appBar: getAppBar(selectedIndex, themeData),
      body: getBody(selectedIndex),
      bottomNavigationBar: renderBottomNavigationBar(
        context,
        selectedIndex,
        (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: getFloatingActionButton(selectedIndex, homeState),
    );
  }

  Widget getBody(int index) {
    switch (index) {
      case 0:
        return const Calendar();
      case 1:
        return const Weather();
      case 2:
        return const CommonSense();
      case 3:
        return const Settings();
      default:
        return const Calendar();
    }
  }

  PreferredSizeWidget? getAppBar(int index, ThemeData themeData) {
    switch (index) {
      case 0:
        return const PreferredSizeAppBar();
      case 1:
        return null;
      case 2:
        return CustomAppBar(
          title: '小常识',
          automaticallyImplyLeading: false,
          backgroundColor: themeData.scaffoldBackgroundColor,
          bottomHeight: kTextTabBarHeight,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        );
      case 3:
        return CustomAppBar(
          title: '设置',
          automaticallyImplyLeading: false,
          backgroundColor: themeData.scaffoldBackgroundColor,
        );
      default:
        return const PreferredSizeAppBar();
    }
  }

  Widget? getFloatingActionButton(int index, CalendarState homeState) {
    var route =
        '/eventCreate/${homeState.selectedYear}/${homeState.selectedMonth}/${homeState.selectedDay}';
    if (index == 0) {
      return FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        onPressed: () {
          navigateTo(context, route);
        },
        child: const Icon(Icons.add),
      );
    }
    return null;
  }
}
