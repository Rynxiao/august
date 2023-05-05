import 'package:flutter/material.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/core/calendar.dart';
import 'package:simple_calendar/theme/spacing.dart';

import '../core/calendar_grid_utils.dart';
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
        final isWork = lunar.isWork;
        final isPrevious = calendar.isPreviousMonth(date.year, date.month);
        final isNext = calendar.isNextMonth(date.year, date.month);

        final dateColor = getDateColor(date);
        final topText = getSubscriptText(lunar);
        final topTextColor = getSubscriptTextColor(lunar);
        final festivals = getFestivals(date);
        final lunarDateColor = getLunarDateColor(festivals, lunar);
        final lunarText = getLunarText(festivals, lunar);
        var opacity = (isPrevious || isNext) ? 0.5 : 1.0;
        var isToday = calendar.isToday(date.year, date.month, date.day);

        return SizedBox(
            width: double.infinity,
            height: 50.0,
            child: Opacity(
              opacity: opacity,
              child: Stack(children: [
                if (isToday)
                  Positioned.fill(
                      child: Container(
                    margin: const EdgeInsets.all(Spacing.xxs),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Spacing.xs),
                      border: Border.all(
                        color: AppColors.orangeRed,
                        width: Spacing.two,
                      ),
                    ),
                  )),
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
                      padding: const EdgeInsets.all(Spacing.two),
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
