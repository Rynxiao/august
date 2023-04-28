import 'package:flutter/material.dart';
import 'package:simple_calendar/core/calendar.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/fontweight.dart';
import 'package:simple_calendar/theme/spacing.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          _buildMonthHeader(),
          _buildWeekHeader(),
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildMonthHeader() {
    var calendar = widget.calendar;
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.lightGray,
              width: 0.1,
            )
          ),
        ),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${calendar.currentYear}年${calendar.currentMonth}月',
            style: const TextStyle(
                color: AppColors.white, fontSize: AppFontSize.medium),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            color: AppColors.white,
            onPressed: () {
              // TODO: Implement month navigation
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeekHeader() {
    var calendar = widget.calendar;
    var headers = calendar.getWeekdayHeaders(true);
    return Row(
      children: List.generate(headers.length, (index) {
        var textColor = index == 0 || index == headers.length - 1
            ? AppColors.pink
            : AppColors.gray100;
        return Expanded(
          child: Container(
            height: Spacing.xxs * 8,
            alignment: Alignment.center,
            child: Text(
              headers[index],
              style: TextStyle(color: textColor, fontSize: AppFontSize.small),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCalendarGrid() {
    var calendar = widget.calendar;
    var calendarDate = calendar.getCalendarForMonth(
        calendar.currentYear, calendar.currentMonth,
        startWithSunday: true);
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(calendarDate.length, (index) {
        final date = calendarDate[index];
        final isPrevious = calendar.isPreviousMonth(date.year, date.month);
        final isNext = calendar.isNextMonth(date.year, date.month);

        var dateColor = date.weekday == 6 || date.weekday == 7
            ? AppColors.pink
            : AppColors.white;

        dateColor =
            (isPrevious || isNext) ? dateColor.withOpacity(0.5) : dateColor;
        final lunarDateColor =
            (isPrevious || isNext) ? AppColors.lightGray : AppColors.white;

        return SizedBox(
          height: 50.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${calendarDate[index].day}',
                  style: TextStyle(
                      color: dateColor,
                      fontWeight: AppFontWeight.regular,
                      fontSize: AppFontSize.large),
                ),
                Text(
                  calendarDate[index].lunar.day,
                  style: TextStyle(
                      color: lunarDateColor,
                      fontWeight: AppFontWeight.regular,
                      fontSize: AppFontSize.fontSize_11),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
