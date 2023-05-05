import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/components/positioned_border.dart';
import 'package:simple_calendar/theme/colors.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/spacing.dart';

import '../core/calendar_grid_utils.dart';
import '../states/home_state.dart';
import '../theme/fontweight.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    var calendarDates = homeState.calendarDates;
    var calendar = homeState.calendar;

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(calendarDates.length, (index) {
        final date = calendarDates[index];
        final lunar = date.lunar;
        final isWork = lunar.isWork;
        final year = date.year;
        final month = date.month;
        final day = date.day;
        final isPrevious = homeState.isPreviousMonth(year, month);
        final isNext = homeState.isNextMonth(year, month);

        final dateColor = getDateColor(date);
        final topText = getSubscriptText(lunar);
        final topTextColor = getSubscriptTextColor(lunar);
        final festivals = getFestivals(date);
        final lunarDateColor = getLunarDateColor(festivals, lunar);
        final lunarText = getLunarText(festivals, lunar);
        var opacity = (isPrevious || isNext) ? 0.5 : 1.0;
        var isToday = calendar.isToday(year, month, day);
        var isSelected = homeState.isSelected(year, month, day);

        return GestureDetector(
          onTap: () {
            homeState.select(year, month, day);
          },
          child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Opacity(
                opacity: opacity,
                child: Stack(children: [
                  if (isToday)
                    PositionedBorder(color: AppColors.white.withOpacity(0.5)),
                  if (isSelected)
                    const PositionedBorder(color: AppColors.orangeRed),
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
              )),
        );
      }),
    );
  }
}
