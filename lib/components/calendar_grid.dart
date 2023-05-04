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
        final isWork = lunar.isWork;
        final isPrevious = calendar.isPreviousMonth(date.year, date.month);
        final isNext = calendar.isNextMonth(date.year, date.month);

        var dateColor = date.weekday == 6 || date.weekday == 7
            ? AppColors.orangeRed.withOpacity(0.7)
            : AppColors.white;
        var topText = isWork != null && isWork ? '班' : '休';
        var topTextColor =
            isWork != null && isWork ? AppColors.orangeRed : AppColors.green;

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
            width: double.infinity,
            height: 50.0,
            child: Opacity(
              opacity: opacity,
              child: Stack(children: [
                SizedBox(
                  width: double.infinity,
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
                if (isWork != null)
                  Positioned(
                    right: 6,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: topTextColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        topText,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: AppFontSize.fontSize_8,
                        ),
                      ),
                    ),
                  ),
              ]),
            ));
      }),
    );
  }
}
