import 'package:flutter/material.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/core/calendar.dart';

import '../theme/fontweight.dart';

class CalendarGrid extends StatelessWidget {
  final Calendar calendar;

  const CalendarGrid({
    Key? key,
    required this.calendar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var calendarDate = calendar.getCalendarForMonth(
        calendar.currentYear, calendar.currentMonth,
        startWithSunday: true);
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(calendarDate.length, (index) {
        final date = calendarDate[index];
        final lunar = date.lunar;
        final festivals = date.festivals;
        final solarTerm = lunar.solarTerm;
        final isPrevious = calendar.isPreviousMonth(date.year, date.month);
        final isNext = calendar.isNextMonth(date.year, date.month);

        var dateColor = date.weekday == 6 || date.weekday == 7
            ? AppColors.orangeRed.withOpacity(0.7)
            : AppColors.white;

        festivals.addAll(lunar.festivals);

        var lunarDateColor = festivals.isNotEmpty
            ? AppColors.orangeRed
            : solarTerm != null
                ? AppColors.green
                : AppColors.white;
        var lunarText =
            festivals.isNotEmpty ? festivals[0] : solarTerm ?? lunar.day;
        var opacity = (isPrevious || isNext) ? 0.5 : 1.0;

        return SizedBox(
            height: 50.0,
            child: Opacity(
              opacity: opacity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${date.day}',
                      style: TextStyle(
                          color: dateColor,
                          fontWeight: AppFontWeight.regular,
                          fontSize: AppFontSize.large),
                    ),
                    Text(
                      lunarText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: lunarDateColor,
                          fontWeight: AppFontWeight.regular,
                          fontSize: AppFontSize.fontSize_11),
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
